#!/bin/bash
before() {
  type nginx
  return $?
}

setup() {
  apt install -y nginx
  echo 'include /var/www/*.conf;' > /etc/nginx/conf.d/include-www.conf
}

start() {
  service nginx start
}

stop() {
  service nginx stop
}

# /etc/nginx
# 安装nginx服务