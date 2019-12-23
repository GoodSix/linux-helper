#!/bin/bash
wget https://nodejs.org/dist/v12.14.0/node-v12.14.0-linux-x64.tar.xz -O nodejs.tar.xz
mkdir nodejs && tar -xvf nodejs.tar.xz -C nodejs
mv nodejs/`ls nodejs/` /usr/local/nodejs
rm -rf nodejs.tar.xz nodejs

# 下载nodejs