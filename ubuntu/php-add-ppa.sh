#!/bin/bash
# 从PPA添加PHP镜像源

echo -e "\n" | add-apt-repository ppa:ondrej/php
apt update
