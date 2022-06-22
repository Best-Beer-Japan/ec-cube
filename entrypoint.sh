#!/bin/bash

password=`echo ${DB_INFO} | jq -r ".password"`
username=`echo ${DB_INFO} | jq -r ".username"` 
host=`echo ${DB_INFO} | jq -r ".host"`
auth_magic=`echo ${EC_SECRETS} | jq -r ".auth_magic"`
admin_route=`echo ${EC_SECRETS} | jq -r ".admin_route"`
docurain_api_token=`echo ${EC_SECRETS} | jq -r ".docurain_api_token"`
mail_url=`echo ${MAIL_INFO} | jq -r ".url"`
shop_name=`echo ${SHOP_NAME}`

cat <<EOF > .env
APP_ENV=prod
APP_DEBUG=0

DATABASE_URL=mysql://${username}:${password}@${host}/${DATABASE}
DATABASE_SERVER_VERSION=8.0

MAILER_URL=${mail_url}

ECCUBE_AUTH_MAGIC=${auth_magic}
ECCUBE_ADMIN_ALLOW_HOSTS=[]
ECCUBE_FORCE_SSL=true
ECCUBE_ADMIN_ROUTE=${admin_route}
ECCUBE_COOKIE_PATH=/
ECCUBE_TEMPLATE_CODE=default
ECCUBE_LOCALE=ja
ECCUBE_TIMEZONE=Asia/Tokyo
ECCUBE_CURRENCY=JPY

DOMAIN=${shop_name}.bestbeerjapan.com

DOCURAIN_API_TOKEN=${docurain_api_token}
EOF

python3 /tmp/link.py && python3 /tmp/start_init.py
php -d memory_limit=256M bin/console cache:clear
exec docker-php-entrypoint apache2-foreground
