#!/bin/bash
apt install -y nginx
(cat <<CONFIG
include /var/www/*.conf;
CONFIG
) > /etc/nginx/conf.d/include-www.conf
service nginx start

# /etc/nginx
# 安装nginx服务