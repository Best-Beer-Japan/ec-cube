import json
import logging
import os
import pathlib
import re
import subprocess

from yaml import load, Loader
import pymysql
import pymysql.cursors


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def initialize_shop_conf_dir():
    root_path = os.getenv("EFS_SHOP_CONF_ROOT", None)
    if root_path is None:
        raise Exception("no EFS_SHOP_CONF_ROOT set.")
    root_path = pathlib.Path(root_path)

    # html
    os.makedirs(root_path / "html",
                mode=755, exist_ok=True)
    # app
    os.makedirs(root_path / "app" / "PluginData",
                mode=755, exist_ok=True)
    os.makedirs(root_path / "app" / "template",
                mode=755, exist_ok=True)


def initialize_eccube():
    logger.info("create schema")
    cwd = os.getcwd()

    # load config
    config_path = os.getenv("CONFIG_PATH", None)
    if config_path is None:
        raise Exception("no CONFIG_PATH set.")
    with open(config_path) as f:
        config = load(f, Loader=Loader)
    plugins = set([plugin["name"] for plugin in config.get("plugins", [])])
    try:
        apache_root = os.getenv("APACHE_DOCUMENT_ROOT")
        apache_root = pathlib.Path(apache_root)
        os.chdir(apache_root)

        logger.info("eccube:install")
        subprocess.run("bin/console eccube:install --no-interaction",
                       shell=True, check=True, capture_output=True)
        subprocess.run("bin/console eccube:generate:proxies",
                       shell=True, check=True, capture_output=True)
        for plugin in plugins:
            if (apache_root / "app" / "Plugin" / plugin).exists():
                logger.info(f"eccube:plugin:install {plugin}")
                subprocess.run(f"bin/console eccube:plugin:install --code={plugin}",
                               shell=True, check=True, capture_output=True)
                logger.info(f"eccube:plugin:enable {plugin}")
                subprocess.run(f"bin/console eccube:plugin:enable --code={plugin}",
                               shell=True, check=True, capture_output=True)
        logger.info("eccube:schema:update")
        subprocess.run("bin/console eccube:schema:update --force",
                       shell=True, check=True, capture_output=True)
        logger.info("doctrine:migrations:migrate")
        subprocess.run("bin/console doctrine:migrations:migrate --no-interaction",
                       shell=True, check=True, capture_output=True)

    finally:
        os.chdir(cwd)


def encode_password(password):
    cwd = os.getcwd()
    try:
        apache_root = os.getenv("APACHE_DOCUMENT_ROOT")
        os.chdir(apache_root)

        out = subprocess.run(f"bin/console security:encode-password --no-interaction {password} 'Eccube\\Entity\\Member'",
                             shell=True, check=True, capture_output=True)
        out = out.stdout.decode("utf-8")
        m = re.search(r"Encoded password\s*([^\s]+)", out)
        hash_password = m.group(1)
        m = re.search(r"Generated salt\s*([^\s]+)", out)
        hash_salt = m.group(1)

        return hash_password, hash_salt
    finally:
        os.chdir(cwd)


def setup_b2j():
    logger.info("setup data")
    # load environments
    database = os.getenv("DATABASE", None)
    if database is None:
        raise Exception("no DATABASE set.")
    db_info = os.getenv("DB_INFO", None)
    if db_info is None:
        raise Exception("no DB_INFO set.")
    db_info = json.loads(db_info)
    config_path = os.getenv("CONFIG_PATH", None)
    if config_path is None:
        raise Exception("no CONFIG_PATH set.")
    # load config
    with open(config_path) as f:
        config = load(f, Loader=Loader)

    conn = pymysql.connect(
        host=db_info["host"],
        port=db_info["port"],
        user=db_info["username"],
        password=db_info["password"],
        db=database,
        charset="utf8mb4"
    )
    try:
        with conn.cursor() as cur:
            # create session table
            cur.execute("CREATE TABLE IF NOT EXISTS `sessions` ("
                        "`sess_id` varchar(128) COLLATE utf8_bin NOT NULL,"
                        "`sess_data` blob NOT NULL,"
                        "`sess_time` int(10) unsigned NOT NULL,"
                        "`sess_lifetime` mediumint(9) NOT NULL,"
                        "PRIMARY KEY (`sess_id`)"
                        ") ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin")

            # change EC site basic info
            if "shop" in config:
                cur.execute("UPDATE dtb_base_info SET "
                            "shop_name = %s, "
                            "email01 = %s, "
                            "email02 = email01, "
                            "email03 = email01, "
                            "email04 = email01, "
                            "update_date = NOW(), "
                            "delivery_fee_extension_enabled = 1 "
                            "WHERE id = %s",
                            (config["shop"]["name"], config["shop"].get("email", None), 1))
            # disable option_product_tax_rule, delivery_fee_excention_enabled
            cur.execute("UPDATE dtb_base_info SET "
                        "option_product_tax_rule = %s, "
                        "delivery_fee_extension_enabled = %s "
                        "WHERE id = %s",
                        (0, 0, 1))
            # create best beer japan user
            if "b2j" in config and "admin" in config["b2j"]:
                username = config["b2j"]["admin"]["username"]
                password, salt = encode_password(
                    config["b2j"]["admin"]["password"])
                cur.execute("UPDATE dtb_member SET "
                            "name = %s, "
                            "login_id = %s, "
                            "password = %s, "
                            "salt = %s, "
                            "update_date = NOW() "
                            "WHERE id = %s",
                            ("管理者", username, password, salt, 1))
            # create brewery user
            if "shop" in config and "admin" in config["shop"]:
                shopname = config["shop"]["name"]
                username = config["shop"]["admin"]["username"]
                password, salt = encode_password(
                    config["shop"]["admin"]["password"])
                cur.execute("INSERT INTO dtb_member ("
                            "work_id,"
                            "authority_id,"
                            "creator_id,"
                            "name,"
                            "login_id,"
                            "password,"
                            "salt,"
                            "sort_no,"
                            "discriminator_type,"
                            "create_date,"
                            "update_date"
                            ") VALUES ("
                            "1,"
                            "1,"
                            "1,"
                            "%s,"
                            "%s,"
                            "%s,"
                            "%s,"
                            "2,"
                            "%s,"
                            "NOW(),"
                            "NOW()"
                            ")",
                            (shopname, username, password, salt, "member"))
            conn.commit()
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()


def setup_initial_data():
    logger.info("setup data")
    # load environments
    database = os.getenv("DATABASE", None)
    if database is None:
        raise Exception("no DATABASE set.")
    db_info = os.getenv("DB_INFO", None)
    if db_info is None:
        raise Exception("no DB_INFO set.")
    db_info = json.loads(db_info)

    with open("/tmp/initialize_data.sql") as f:
        raw_sqls = [x.strip() for x in f.read().split(";")]
    sqls = []
    for raw in raw_sqls:
        ls = raw.splitlines()
        tmp = []
        for line in ls:
            line = line.strip()
            if len(line) == 0:
                continue
            if line.startswith("--"):
                continue
            tmp.append(line)
        if len(tmp) > 0:
            sqls.append(" ".join(tmp))

    conn = pymysql.connect(
        host=db_info["host"],
        port=db_info["port"],
        user=db_info["username"],
        password=db_info["password"],
        db=database,
        charset="utf8mb4"
    )
    try:
        with conn.cursor() as cur:
            for sql in sqls:
                logger.info(sql)
                cur.execute(sql)
            conn.commit()
    except Exception:
        conn.rollback()
        raise
    finally:
        conn.close()


def main():
    initialize_shop_conf_dir()
    initialize_eccube()
    setup_b2j()
    setup_initial_data()


if __name__ == "__main__":
    main()
