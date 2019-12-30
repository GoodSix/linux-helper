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
  php5.6-gd \
  php5.6-mbstring \
  php5.6-mysqli \
  php5.6-odbc \
  php5.6-pdo-pgsql \
  php5.6-pdo-sqlite \
  php5.6-soap \
  php5.6-tidy

  if [[ -e /etc/nginx ]]; then
    echo 'location ~ [^/]\.php(/|$) {
    fastcgi_pass  unix:/var/run/php/php5.6-fpm.sock;
    fastcgi_index  index.php;
    fastcgi_split_path_info ^(.+\.php)(.*)$;
    fastcgi_param  PATH_INFO $fastcgi_path_info;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
}' > /etc/nginx/enable-php5.6.conf
  fi
}

start() {
  service php5.6-fpm start
}

stop() {
  service php5.6-fpm stop
}

# /etc/php
# 安装PHP5.6和常用扩展包
