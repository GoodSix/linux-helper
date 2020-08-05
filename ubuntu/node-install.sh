#!/bin/bash

# 为当前用户安装nodejs

if [[ ! `which npm` ]]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash && \
    nvm install --lts
fi
