#!/bin/bash
before() {
  if [[ `type php5.6` && `type nginx` && `type mysql` ]]; then
    return 0
  else
    return 1
  fi
}

setup() {
  echo -e 'y' | source `dirname $1`/eoogo.sh php-install-5.6
  echo -e 'y' | source `dirname $1`/eoogo.sh nginx-install
  echo -e 'y' | source `dirname $1`/eoogo.sh mysql-install
}

start() {
  service nginx start
  service php5.6-fpm start
  service mysql start
}

stop() {
  service nginx stop
  service php5.6-fpm stop
  service mysql stop
}

# /etc/nginx
# /etc/php
# /etc/mysql
# /var/lib/mysql
# 安装集成nginx、php5.6、mysql的环境
