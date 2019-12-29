#!/bin/bash
before() {
  is_install=`php7.2 -m | grep 'xdebug'`
  if [[ -z $is_install ]]; then
    return 1
  else
    return 0
  fi
}

setup() {
  config='

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9001
'
  apt install php7.2-xdebug && \
  echo $config >> /etc/php/7.2/fpm/php.ini && \
  echo $config >> /etc/php/7.2/cli/php.ini
}

# 开启php7.2的xdebug扩展