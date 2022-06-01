FROM php:7.3-apache-bullseye

# for EFS
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

ENV APACHE_DOCUMENT_ROOT /var/www/html
ENV EFS_SHOP_CONF_ROOT /mnt/shop_conf
ENV EFS_PLUGINS_ROOT /mnt/plugins

RUN apt-get update && apt-get install --no-install-recommends -y \
  vim \
  jq \
  apt-transport-https \
  apt-utils \
  build-essential \
  curl \
  debconf-utils \
  gcc \
  git \
  gnupg2 \
  libfreetype6-dev \
  libicu-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  libpq-dev \
  libzip-dev \
  locales \
  ssl-cert \
  unzip \
  zlib1g-dev \
  python3 \
  python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && echo "en_US.UTF-8 UTF-8" >/etc/locale.gen \
  && locale-gen \
  ;

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
  && docker-php-ext-install -j$(nproc) zip gd mysqli pdo_mysql opcache intl pgsql pdo_pgsql \
  ;

RUN pecl install apcu && echo "extension=apcu.so" > /usr/local/etc/php/conf.d/apc.ini

COPY apacheconfig/000-default.conf /etc/apache2/sites-available/
RUN mkdir -p ${APACHE_DOCUMENT_ROOT} \
  && sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
  && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
  ;
RUN echo 'SetEnvIf X-Forwarded-Proto ^https$ HTTPS=on' >> /etc/apache2/apache2.conf

RUN a2enmod rewrite headers ssl
## Enable SSL
#RUN ln -s /etc/apache2/sites-available/default-ssl.conf /etc/apache2/sites-enabled/default-ssl.conf
#EXPOSE 443

# Use the default production configuration
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
# Override with custom configuration settings
COPY dockerbuild/php.ini $PHP_INI_DIR/conf.d/

COPY app ${APACHE_DOCUMENT_ROOT}/app/
COPY bin ${APACHE_DOCUMENT_ROOT}/bin/
COPY codeception ${APACHE_DOCUMENT_ROOT}/codeception/
COPY gulp ${APACHE_DOCUMENT_ROOT}/gulp/
COPY html ${APACHE_DOCUMENT_ROOT}/html/
COPY src ${APACHE_DOCUMENT_ROOT}/src/
COPY tests ${APACHE_DOCUMENT_ROOT}/tests/
COPY .htaccess \
     .php_cs.dist \
     codeception.sh \
     codeception.yml \
     composer.json \
     composer.lock \
     gulpfile.js \
     index.php \
     maintenance.php \
     package.json \
     package-lock.json \
     phpunit.xml.dist \
     robots.txt \
     symfony.lock \
     web.config ${APACHE_DOCUMENT_ROOT}/

WORKDIR ${APACHE_DOCUMENT_ROOT}

RUN curl -sS https://getcomposer.org/installer \
  | php  -- --version=1.10.15 \
  && mv composer.phar /usr/bin/composer \
  && composer config -g repos.packagist composer https://packagist.jp \
  && composer global require hirak/prestissimo \
  && chown www-data:www-data /var/www \
  && mkdir -p ${APACHE_DOCUMENT_ROOT}/var \
  && chown -R www-data:www-data ${APACHE_DOCUMENT_ROOT} \
  && find ${APACHE_DOCUMENT_ROOT} -type d -print0 \
  | xargs -0 chmod g+s \
  ;

USER www-data

RUN composer install \
  --no-scripts \
  --no-autoloader \
  -d ${APACHE_DOCUMENT_ROOT} \
  ;

RUN composer dumpautoload -o --apcu

RUN rm -rf ${APACHE_DOCUMENT_ROOT}/html \
 && ln -s ${EFS_SHOP_CONF_ROOT}/html ${APACHE_DOCUMENT_ROOT}/html
RUN rm -rf ${APACHE_DOCUMENT_ROOT}/app/PluginData \
 && ln -s ${EFS_SHOP_CONF_ROOT}/app/PluginData ${APACHE_DOCUMENT_ROOT}/app/PluginData
RUN rm -rf ${APACHE_DOCUMENT_ROOT}/app/template \
 && ln -s ${EFS_SHOP_CONF_ROOT}/app/template ${APACHE_DOCUMENT_ROOT}/app/template

#RUN touch .env \
# && bin/console eccube:generate:proxies \
# && rm .env

USER root

RUN mkdir -p ${EFS_SHOP_CONF_ROOT}
RUN mkdir -p ${EFS_PLUGINS_ROOT}
COPY link.py /tmp/
COPY initialize.py /tmp/
COPY initialize_data.sql /tmp/
RUN python3 -m pip install --upgrade pip && python3 -m pip install \
    PyMySQL \
    pyyaml

ADD entrypoint.sh ${APACHE_DOCUMENT_ROOT}
ENTRYPOINT ["/bin/bash"]
CMD ["entrypoint.sh"]
