#!/bin/bash
before() {
  type mysql
  return $?
}

setup() {
  apt install -y mysql-server-5.7
  if [[ `service mysql start` ]]; then
    # 默认配置， 视为在容器中
    cp $1/mysql/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

    user=`cat /etc/mysql/debian.cnf | grep 'user' | grep -o '= .*$' | head -1`
    password=`cat /etc/mysql/debian.cnf | grep 'password' | grep -o '= .*$' | head -1`
    mysql -u${user:2} -p${password:2} -e 'grant all privileges on *.* to root@"%" identified by "eoogo" with grant option;'
    mysql -u${user:2} -p${password:2} -e 'grant all privileges on *.* to root@"localhost" identified by "root" with grant option;'
    mysql -u${user:2} -p${password:2} -e 'flush privileges;'
    service mysql stop
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


#/etc/mysql
#/var/lib
# 安装mysql5.7服务, 默认开启远程, 账号:root密码:eoogo