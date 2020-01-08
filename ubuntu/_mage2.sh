#!/bin/bash
before() {
    echo -e 'y' | source `dirname $1`/eoogo.sh _lnmp
    if [[ -d /var/www/magento2 ]]; then
	    return 0;
    else
	    return 1;
    fi
}

setup() {
    cd /var/www
    echo 'upstream fastcgi_backend {
	server unix:/var/run/php/php7.2-fpm.sock;
}

server {
	listen 80;
	server_name _;
	set $MAGE_ROOT /var/www/magento2;
	include /var/www/magento2/nginx.conf.sample;
}' > _mage2.conf && \
    git clone https://github.com/magento/magento2 && \
    cd magento2 && \
    git checkout 2.2 && \
    chmod -R 777 * && \
    composer install && \
    service nginx start && \
    nginx -s reload && \
    service nginx stop && \
    service mysql start && \
    mysql -uroot -proot -e "create database magento;" && \
    service mysql stop
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
# 初始化magento2项目
