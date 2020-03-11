**为[eoogo/docker-devt](https://github.com/eoogo/docker-devt)提供的初始化脚本，用于快速安装配置一些软件**

- [基本环境参考](https://github.com/eoogo/docker-ubuntu),[现有可用命令参考](./command.md)


文件名规则为`服务名称-服务行为-扩展`  
在脚本文件中最后一行注释为功能介绍  
在此之前的注释应为需要映射的文件夹

完整脚本包含:  
*（在外面的代码会在执行以下函数的时候执行）*  
- before 检测是否需要安装  
- setup   开始安装  
- start   启动服务  
- stop    关闭服务  
\# 末尾注释需要持久化的文件或文件夹  
\# 末尾的注释说明**是必须的**  

如果脚本中未包含以上任何函数不会进行之后的操作  

因此和[docker-devt](https://github.com/eoogo/docker-devt)搭配可以存在这种写法
> docker run -it -v `pwd`/myScript.sh:/var/www/myScript.sh eoogo/devt #要安装的环境# myScript


以下是脚本基本结构示例
```shell
#!/bin/bash

# $1 = 配置文件所在目录
before() { # 该方法必须存在并返回非0， 否则不会执行setup等后续方法
    type server
    return $?
}

# $1 = 配置文件所在目录
setup() {
    # install script
    # 开始安装服务
    # 执行完毕后服务不应处于开启状态，声明start函数自动开启
}

start() {
    # 启动服务方式
}

stop() {
    # 停止服务方式
}

# 末尾处注释为需要持久化的路径, 注意在此注释后的空格为必须的
# /etc/server
# /var/log/server
# 最后一行为脚本的行为说明，是必须的！
```
