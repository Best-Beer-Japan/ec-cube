#!/bin/bash

password=`echo ${DB_INFO} | jq -r ".password"`
username=`echo ${DB_INFO} | jq -r ".username"` 
host=`echo ${DB_INFO} | jq -r ".host"`
auth_magic=`echo ${EC_SECRETS} | jq -r ".auth_magic"`
mail_url=`echo ${MAIL_INFO} | jq -r ".url"`

cat <<EOF > .env
APP_ENV=prod
APP_DEBUG=0

DATABASE_URL=mysql://${username}:${password}@${host}/${DATABASE}
DATABASE_SERVER_VERSION=8.0

MAILER_URL=${mail_url}

ECCUBE_AUTH_MAGIC=${auth_magic}
ECCUBE_ADMIN_ALLOW_HOSTS=[]
ECCUBE_FORCE_SSL=true
ECCUBE_ADMIN_ROUTE=b2jadmin
ECCUBE_COOKIE_PATH=/
ECCUBE_TEMPLATE_CODE=default
ECCUBE_LOCALE=ja
ECCUBE_TIMEZONE=Asia/Tokyo
ECCUBE_CURRENCY=JPY
EOF

python3 /tmp/link.py && exec docker-php-entrypoint apache2-foreground
