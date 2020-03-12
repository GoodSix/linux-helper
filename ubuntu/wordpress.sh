#!/bin/bash
before() {
    if [[ `type php7.2` && `type nginx` && `type mysql` ]]; then
        return 0
    else
        return 1
    fi
}

setup() {
    echo -e 'y' | source `dirname $1`/eoogo.sh _lnmp
    cd /var/www;
    while [[ ! -f latest-zh_CN.tar.gz ]]; do
        wget https://cn.wordpress.org/latest-zh_CN.tar.gz
    done
    unar latest-zh_CN.tar.gz && rm -rf latest-zh_CN.tar.gz
    chmod 777 wordpress
    mysql -uroot -proot -e "create database wordpress;"
    read -p '您的域名：' domain
    (cat <<CONF
server {
        listen 80;
        server_name ${domain};
        root /var/www/wordpress;
        index index.html index.php;
        location / {
                try_files \$uri \$uri/ /index.php$request_uri;
        }
        include enable-php7.2.conf;
}
CONF
    ) > nginx.conf;
    nginx -s reload
    cat <<HINT
现在已经成功安装了wordpress, 请打开 http://${domain} 进行安装

需要更多帮助可移步 https://www.if-she.com 获取相关资料

数据库名(默认即可): wordpress
用户名：root
密码: root
数据库主机: localhost
表前缀(随意)
HINT
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
# 安装worldpress
