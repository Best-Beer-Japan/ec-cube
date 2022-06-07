import os
import pathlib
import shutil
from yaml import load, Loader


# docukent root
document_root = os.getenv("APACHE_DOCUMENT_ROOT", None)
if document_root is None:
    raise Exception("no APACHE_DOCUMENT_ROOT set.")
document_root = pathlib.Path(document_root)
# plugin path
plugin_root = os.getenv("EFS_PLUGINS_ROOT", None)
if plugin_root is None:
    raise Exception("no EFS_PLUGINS_ROOT set.")
plugin_root = pathlib.Path(plugin_root)
# shop conf path
shop_conf_root = os.getenv("EFS_SHOP_CONF_ROOT", None)
if shop_conf_root is None:
    raise Exception("no EFS_SHOP_CONF_ROOT set.")
shop_conf_root = pathlib.Path(shop_conf_root)
# load config
config_path = os.getenv("CONFIG_PATH", None)
if config_path is None:
    raise Exception("no CONFIG_PATH set.")
config_path = pathlib.Path(config_path)

if config_path.exists():
    with open(config_path) as f:
        config = load(f, Loader=Loader)

    plugins = config.get("plugins", [])
    for plugin in plugins:
        src_global = plugin_root / plugin["name"]
        src_local = shop_conf_root / "plugins" / plugin["name"]
        dst = document_root / "app" / "Plugin" / plugin["name"]
        if src_local.exists():
            src = src_local
        else:
            src = src_global
        if src.exists():
            if dst.exists():
                shutil.rmtree(dst)
            os.symlink(src, dst, target_is_directory=True)
