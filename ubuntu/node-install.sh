#!/bin/bash
before() {
    if [[ -e /usr/local/nodejs ]]; then
        return 0
    else
        return 1
    fi
}

setup() {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
}

# 为当前用户安装nodejs
