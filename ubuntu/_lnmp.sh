#!/bin/bash
before() {
  if [[ `type php7.2` && `type nginx` && `type mysql` ]]; then
    return 0
  else
    return 1
  fi
}

setup() {
  echo -e 'y' | `dirname $1`/eoogo.sh php-install-7.2
  echo -e 'y' | `dirname $1`/eoogo.sh nginx-install
  echo -e 'y' | `dirname $1`/eoogo.sh mysql-install
}

start() {
  service nginx start
  service php7.2-fpm start
  service mysql start
}

stop() {
  service nginx stop
  service php7.2-fpm stop
  service mysql stop
}

# /etc/nginx
# /etc/php
# /etc/mysql
# /var/lib/mysql
# 安装集成nginx、php7.2、mysql的环境