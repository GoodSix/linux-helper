#!/bin/bash

# 安装集成nginx、php5.6、mysql的环境

if [[ ! `which php5.6` ]]; then
    curl -o- https://raw.githubusercontent.com/eoogo/du-aide/master/ubuntu/php-install-5.6.sh | bash
    service php5.6-fpm start
fi

if [[ ! `which nginx` ]]; then
    curl -o- https://raw.githubusercontent.com/eoogo/du-aide/master/ubuntu/nginx-install.sh | bash
    service nginx start
fi

if [[ ! `which mysql` ]]; then
    curl -o- https://raw.githubusercontent.com/eoogo/du-aide/master/ubuntu/mysql-install.sh | bash
    service mysql start
fi

