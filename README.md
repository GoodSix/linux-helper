为[eoogo/ubuntu](https://github.com/eoogo/docker-ubuntu)提供的初始化脚本，用于快速安装配置一些软件 

文件名规则为`服务名称-服务行为-扩展说明`  
在脚本文件中最后一行注释为功能介绍
在此之前的注释应为需要映射的文件夹

完整脚本包含:  
before 检测是否需要安装  
setup   开始安装  
start   启动服务  
stop    关闭服务  

```shell
#!/bin/bash

# $1 = 配置文件所在目录
before() { # 该方法必须存在并返回非0， 否则不会执行setup
    type server
    return $?
}

# $1 = 配置文件所在目录
setup() {
    # install script
    # 用于安装服务
}

# $1 = 配置文件所在目录
start() {
    # 用于启动服务
}

stop() {
    # 用于停止服务
}

#/etc/server # 末尾处注释为需要持久化的路径
#/var/log/server # 此处不能带有空格
# 最后一行为脚本的行为说明
```

- 错误
    - ./eoogo.sh: line 49: type: __after: not found
       尝试调用脚本执行完毕后回调方法不存在，无伤大雅