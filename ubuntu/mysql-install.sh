#!/bin/bash
# 安装mysql5.7服务,默认开启远程,账号:root密码:root

if [[ ! `which mysql` ]]; then
    echo -e "\n" | add-apt-repository ppa:t.c/mysql-5.7
    apt update
    if [[ `apt install -y mysql-server-5.7 && service mysql start` ]]; then
        user=`cat /etc/mysql/debian.cnf | grep 'user' | grep -o '= .*$' | head -1`
        password=`cat /etc/mysql/debian.cnf | grep 'password' | grep -o '= .*$' | head -1`
        mysql -u${user:2} -p${password:2} -e 'grant all privileges on *.* to root@"localhost" identified with mysql_native_password by "root" with grant option;'
        mysql -u${user:2} -p${password:2} -e 'flush privileges;'
        service mysql stop
    else
        echo 'mysql install fail!';
        exit 500;
    fi
fi
