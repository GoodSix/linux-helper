#!/bin/bash
before() {
    if [[ -e /usr/local/nodejs ]]; then
        return 0
    else
        return 1
    fi
}

setup() {
    # wget https://nodejs.org/dist/v12.14.0/node-v12.14.0-linux-x64.tar.xz -O nodejs.tar.xz
    # mkdir nodejs && tar -xvf nodejs.tar.xz -C nodejs
    # mv nodejs/`ls nodejs/` /usr/local/nodejs
    # rm -rf nodejs.tar.xz nodejs
    # echo 'PATH="$PATH:/usr/local/nodejs/bin"' >> ~/.bashrc
    apt install nodejs npm -y;
    npm i -g n;
    n stable;
}

# 为当前用户安装nodejs