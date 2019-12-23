#!/bin/bash
sudo apt-get install python-software-properties -y
sudo apt-get install software-properties-common -y
echo -e "\n" | sudo add-apt-repository ppa:ondrej/php5-oldstable
sudo apt update

# 从PPA添加PHP镜像源