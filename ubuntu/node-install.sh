#!/bin/bash
before() {
    if [[ -e /usr/local/nodejs ]]; then
        return 0
    else
        return 1
    fi
}

setup() {
    apt install nodejs npm -y;
    npm i -g n;
    n stable;
}

# 为当前用户安装nodejs
