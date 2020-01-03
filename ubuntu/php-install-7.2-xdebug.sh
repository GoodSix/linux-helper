#!/bin/bash
before() {
  if [[ ! `type php7.2` ]]; then echo 'No php7.2 installed'; return 0; fi
  if [[ `php7.2 -m | grep 'xdebug'` ]]; then
    return 0
  else
    return 1
  fi
}

setup() {
  apt install php7.2-xdebug && \
  echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9001' >> /etc/php/7.2/fpm/php.ini && \
  echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9001' >> /etc/php/7.2/cli/php.ini && \
  service php7.2-fpm restart # 重启PHP服务
}

# 开启php7.2的xdebug扩展