import json
import logging
import os
import pathlib
import subprocess

import pymysql
import pymysql.cursors


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def initialize_eccube():
    # load environments
    database = os.getenv("DATABASE", None)
    if database is None:
        raise Exception("no DATABASE set.")
    db_info = os.getenv("DB_INFO", None)
    if db_info is None:
        raise Exception("no DB_INFO set.")
    db_info = json.loads(db_info)
    conn = pymysql.connect(
        host=db_info["host"],
        port=db_info["port"],
        user=db_info["username"],
        password=db_info["password"],
        db=database,
        charset="utf8mb4"
    )
    with conn.cursor() as cur:
        try:
            cur.execute("select count(*) from migration_versions")
            for row in cur:
                count = int(row[0])
                break
            if count <= 0:
                raise Exception("no migrations ?")
        except Exception:
            logger.info("maybe not initialized...")
            return

    cwd = os.getcwd()
    try:
        apache_root = os.getenv("APACHE_DOCUMENT_ROOT")
        apache_root = pathlib.Path(apache_root)
        os.chdir(apache_root)

        logger.info("eccube:generate:proxies")
        subprocess.run("bin/console eccube:generate:proxies",
                       shell=True, check=True, capture_output=True)
        logger.info("eccube:schema:update")
        subprocess.run("bin/console eccube:schema:update --force",
                       shell=True, check=True, capture_output=True)
        logger.info("doctrine:migrations:migrate")
        subprocess.run("bin/console doctrine:migrations:migrate --no-interaction",
                       shell=True, check=True, capture_output=True)
    finally:
        os.chdir(cwd)


def main():
    initialize_eccube()


if __name__ == "__main__":
    main()
