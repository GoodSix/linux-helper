#!/bin/bash

# 安装nginx服务

if [[ ! `which nginx` ]]; then
    apt install -y nginx
    echo 'include /var/www/*.conf;' > /etc/nginx/conf.d/include-www.conf
    # rm -f /etc/nginx/sites-enabled/default
fi

