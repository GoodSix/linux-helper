#!/bin/bash
before() {
  if [[ -e /usr/local/redis ]]; then
    return 0
  else
    return 1
  fi
}

setup() {
  mkdir -p /usr/local/redis
  cd /usr/local/redis

  wget https://github.com/antirez/redis/archive/5.0.7.zip -O redis.zip
  if [[ ! `unzip` ]]; then apt install -y unzip; fi

  unzip redis.zip
  cd `ls | grep 'redis-'`
  if [[ ! `make` ]]; then apt install -y make; fi

  make && make install

  mv src/redis-server /usr/local/redis/redis_server
  mv src/redis-cli /usr/local/redis/
  mkdir -p /var/lib/redis
  cd ..
  rm -rf redis.zip `ls | grep 'redis-'`

  cd /usr/local/redis
  echo 'cd $(dirname ${BASH_SOURCE}) && ./redis_server ./redis.conf' > redis-server
  chmod +x redis-server

  cp $1/redis/redis.conf /usr/local/redis/redis.conf
  echo 'PATH=$PATH:/usr/local/redis' >> ~/.bashrc
}

start() {
  /usr/loca/redis/redis-server
}

stop() {
  echo 'redis的停止的脚本暂时没写好呢，自己去停止一下吧'
}

# /var/lib/redis
# 安装redis服务