import logging
import os
import pathlib
import subprocess


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()
logger.setLevel(logging.INFO)


WAIT_INITIALIZE_FLAG_FILE = pathlib.Path("/mnt/shop_conf/.wait_initialize")
UPDATE_FLAG_FILE = pathlib.Path("/mnt/shop_conf/.db_update")


def initialize_eccube():
    if WAIT_INITIALIZE_FLAG_FILE.exists():
        logger.info("system not initialized...skip")
        return
    cwd = os.getcwd()
    try:
        apache_root = os.getenv("APACHE_DOCUMENT_ROOT")
        apache_root = pathlib.Path(apache_root)
        os.chdir(apache_root)

        logger.info("eccube:generate:proxies")
        ret = subprocess.run("bin/console eccube:generate:proxies",
                             shell=True, capture_output=True)
        if ret.returncode != 0:
            stdout = ret.stdout.decode("utf-8")
            stderr = ret.stderr.decode("utf-8")
            message = f"{stdout}\n{stderr}"
            raise Exception(message)
        if UPDATE_FLAG_FILE.exists():
            logger.info("eccube:schema:update")
            ret = subprocess.run("bin/console eccube:schema:update --force",
                                 shell=True, capture_output=True)
            if ret.returncode != 0:
                stdout = ret.stdout.decode("utf-8")
                stderr = ret.stderr.decode("utf-8")
                message = f"{stdout}\n{stderr}"
                raise Exception(message)
            logger.info("doctrine:migrations:migrate")
            ret = subprocess.run("bin/console doctrine:migrations:migrate --no-interaction",
                                 shell=True, capture_output=True)
            if ret.returncode != 0:
                stdout = ret.stdout.decode("utf-8")
                stderr = ret.stderr.decode("utf-8")
                message = f"{stdout}\n{stderr}"
                raise Exception(message)
    finally:
        os.chdir(cwd)


def main():
    initialize_eccube()


if __name__ == "__main__":
    main()
