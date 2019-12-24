#!/bin/bash
$(dirname ${BASH_SOURCE})/php-add-source.sh

apt install -y php7.2-fpm \
php7.2-dev \
php7.2-bcmath \
php7.2-bz2 \
php7.2-curl \
php7.2-dom \
php7.2-gd \
php7.2-mbstring \
php7.2-mysqli \
php7.2-odbc \
php7.2-pdo-mysql \
php7.2-pdo-odbc \
php7.2-pdo-pgsql \
php7.2-pdo-sqlite \
php7.2-simplexml \
php7.2-soap \
php7.2-sqlite3 \
php7.2-tidy \
php7.2-wddx \
php7.2-xml \
php7.2-xsl \
php7.2-lib

# 安装PHP7.2和常用扩展包