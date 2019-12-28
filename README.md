为[eoogo/ubuntu](https://github.com/eoogo/docker-ubuntu)提供的初始化脚本，用于快速安装配置一些软件 

文件名规则为`服务名称-服务行为-扩展`  
在脚本文件中最后一行注释为功能介绍  
在此之前的注释应为需要映射的文件夹

完整脚本包含:  
before 检测是否需要安装  
setup   开始安装  
start   启动服务  
stop    关闭服务  
其外部命令分别会在  
- docker eoogo/devt
    - 首次安装
    - 创建映射
    - 启动
    - 关闭
    - 启动关闭 (两次)
      
时执行

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
    # 开始安装服务
}

start() {
    # 启动服务方式
}

stop() {
    # 停止服务方式
}

# /etc/server # 末尾处注释为需要持久化的路径
# /var/log/server
# 最后一行为脚本的行为说明
```