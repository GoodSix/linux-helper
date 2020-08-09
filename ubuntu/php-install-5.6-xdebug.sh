#!/bin/bash

# 开启php5.6的xdebug扩展

if [[ ! `type php5.6` ]]; then
    echo 'No php5.6 installed';
elif [[ `php5.6 -m | grep 'xdebug'` ]]; then
    echo 'installed';
else
    apt install php5.6-xdebug && \
    echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9000' >> /etc/php/5.6/fpm/php.ini && \
    echo '

[Xdebug]
xdebug.remote_autostart=On
xdebug.remote_enable=On
xdebug.remote_host=0.0.0.0
xdebug.remote_port=9000' >> /etc/php/5.6/cli/php.ini && \
    service php5.6-fpm restart # 重启PHP服务
fi
