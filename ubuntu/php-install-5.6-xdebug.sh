#!/bin/bash
before() {
  is_install=`php5.6 -m | grep 'xdebug'`
  if [[ -z $is_install ]]; then
    return 1
  else
    return 0
  fi
}

setup() {
  apt install php5.6-xdebug && \
  echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9001' >> /etc/php/5.6/fpm/php.ini && \
  echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9001' >> /etc/php/5.6/cli/php.ini
}

# 开启php5.6的xdebug扩展