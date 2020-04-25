#!/bin/bash
before() {
    if [[ ! `type php` ]]; then echo 'No php installed'; return 0; fi
    return 1
}

setup() {
    # update composer
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
}

# 更新php的composer到最新版