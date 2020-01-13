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
    if [[ ! `type unzip` ]]; then apt install -y unzip; fi

    unzip redis.zip
    cd `ls | grep 'redis-'`
    if [[ ! `type make` ]]; then apt install -y make; fi

    make && make install
    if [[ $? ]]; then
        echo 'Redis编译失败';
	    exit 500;
    fi

    mv src/redis-server /usr/local/redis/redis_server
    mv src/redis-cli /usr/local/redis/
    # 在docker中运用此配置
    if [[ $eoogo_docker_devt ]]; then
        cp $1/redis/redis.conf /usr/local/redis/redis.conf
    else
        mv redis.conf /usr/local/redis.conf
    fi
    mkdir -p /var/lib/redis
    cd ..
    rm -rf redis.zip `ls | grep 'redis-'`

    cd /usr/local/redis
    echo 'cd $(dirname ${BASH_SOURCE}) && ./redis_server ./redis.conf' > redis-server
    chmod +x redis-server
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
