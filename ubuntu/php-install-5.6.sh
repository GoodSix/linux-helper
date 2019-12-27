#!/bin/bash
before() {
  type php5.6
  return $?
}

setup() {
  echo -e 'y' | `dirname $1`/eoogo.sh php-add-ppa
  
  apt install -y php5.6-fpm \
  php5.6-dev \
  php5.6-bcmath \
  php5.6-bz2 \
  php5.6-curl \
  php5.6-dom \
  php5.6-gd \
  php5.6-mbstring \
  php5.6-mysqli \
  php5.6-odbc \
  php5.6-pdo-mysql \
  php5.6-pdo-odbc \
  php5.6-pdo-pgsql \
  php5.6-pdo-sqlite \
  php5.6-simplexml \
  php5.6-soap \
  php5.6-sqlite3 \
  php5.6-tidy \
  php5.6-wddx \
  php5.6-xml \
  php5.6-xsl \
  php5.6-lib
}

start() {
  service php5.6-fpm start
}

stop() {
  service php5.6-fpm stop
}

# 安装PHP5.6和常用扩展包