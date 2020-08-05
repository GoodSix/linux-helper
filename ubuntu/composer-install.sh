#!/bin/bash

# 更新php的composer到最新版

if [[ ! `which composer` ]]; then
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
fi

