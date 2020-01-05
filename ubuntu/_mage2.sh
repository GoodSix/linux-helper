#!/bin/bash
before() {
    echo -e 'y' | `dirname $1`/eoogo.sh _lnmp
    return 1
}

setup() {
    cd /var/www
    if [[ ! -d magento2 ]]; then git clone https://github.com/magento/magento2; fi

    echo 'upstream fastcgi_backend {
	server unix:/var/run/php/php7.2-fpm.sock;
}

server {
	listen 80;
	server_name _;
	set $MAGE_ROOT /var/www/magento2;
	include /var/www/magento2/nginx.conf.sample;
}' > nginx.conf

    cd magento2
    git checkout 2.2
    composer install
}


# 初始化magento2项目