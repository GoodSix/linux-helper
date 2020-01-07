#!/bin/bash
before() {
    type mysql
    return $?
}

setup() {
    if [[ `apt install -y mysql-server-5.7 && service mysql start` ]]; then
        user=`cat /etc/mysql/debian.cnf | grep 'user' | grep -o '= .*$' | head -1`
        password=`cat /etc/mysql/debian.cnf | grep 'password' | grep -o '= .*$' | head -1`
        mysql -u${user:2} -p${password:2} -e 'grant all privileges on *.* to root@"localhost" identified by "root" with grant option;'
        mysql -u${user:2} -p${password:2} -e 'flush privileges;'
        if [[ $eoogo_docker_devt ]]; then # 在容器中自动添加远程连接身份
            mysql -u${user:2} -p${password:2} -e 'grant all privileges on *.* to root@"%" identified by "root" with grant option;'
        fi
        service mysql stop
        if [[ $eoogo_docker_devt ]]; then # 在容器中引入这个配置默认配置
            cp $1/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
        fi
    else
        echo 'mysql安装失败了';
        exit 500;
    fi
}

start() {
    service mysql start
}

stop() {
    service mysql stop
}


# /etc/mysql
# /var/lib/mysql
# 安装mysql5.7服务,默认开启远程,账号:root密码:root