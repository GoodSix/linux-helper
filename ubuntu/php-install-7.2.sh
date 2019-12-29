#!/bin/bash
before() {
  type php7.2
  return $?
}

setup() {
  echo -e 'y' | `dirname $1`/eoogo.sh php-add-ppa
  
  apt install -y php7.2-fpm \
  php7.2-dev \
  php7.2-bcmath \
  php7.2-bz2 \
  php7.2-curl \
  php7.2-gd \
  php7.2-mbstring \
  php7.2-mysqli \
  php7.2-odbc \
  php7.2-pdo-pgsql \
  php7.2-pdo-sqlite \
  php7.2-soap \
  php7.2-tidy

  if [[ -e /etc/nginx ]]; then
    echo 'location ~ [^/]\.php(/|$) {
    fastcgi_pass  /var/run/php/php7.2-fpm.sock;
    fastcgi_index  index.php;
    fastcgi_split_path_info ^(.+\.php)(.*)$;
    fastcgi_param  PATH_INFO $fastcgi_path_info;
    fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
    include        fastcgi_params;
}' > /etc/nginx/enable-php7.2.conf
  fi
}

start() {
  service php7.2-fpm start
}

stop() {
  service php7.2-fpm stop
}

# /etc/php
# 安装PHP7.2和常用扩展包