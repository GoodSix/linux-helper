#!/bin/bash
apt-get install python-software-properties -y
apt-get install software-properties-common -y
echo -e "\n" | add-apt-repository ppa:ondrej/php5-oldstable
apt update

# 从PPA添加PHP镜像源