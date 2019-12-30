#!/bin/bash
before() {
  return 1
}

setup() {
  apt-get install python-software-properties -y
  apt-get install software-properties-common -y
  echo -e "\n" | add-apt-repository ppa:ondrej/php
  apt update
}


# 从PPA添加PHP镜像源