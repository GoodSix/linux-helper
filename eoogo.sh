#!/bin/bash
:<<EOF
    github:         eoogo
    qq email:       1434389213@qq.com
EOF

sys=`awk -F= '/^NAME/{print $2}' /etc/os-release`;
sys=${sys:1:-1};
help=`dirname ${BASH_SOURCE}`

# 获取对应系统的脚本
case $sys in
    'Ubuntu'):
        helper="$help/ubuntu"
    ;;
    'CentOS Linux'):
        helper="$help/centos"
    ;;
esac;

# 当前执行的脚本绝对位置
# 第一次: 检测是否为实际文件路径
# 第二次: 检测在/var/www/下是否存在
# 第三次: 在eoogo/助手目录下绝对搜索
# 第四次: 在eoogo/助手目录下模糊搜索
if [[ ! -f "$1.sh" ]]; then
  # 检测脚本在eoogo/docker-devt的工作目录是否存在，不是实际的文件并且在工作目录也没有的时候才会去助手中搜索
  script="/var/www/$1.sh"
  if [[ ! -f $script ]]; then script=`find $helper/ -name "$1.sh" | head -1`; fi
  if [[ ! $script ]]; then script=`find $helper/ -name "$1*.sh" | head -1`; fi
else
  script="$1.sh"
fi
if [[ ! $script ]]; then echo 'There is no executable script'; exit 404; fi

description=$(cat $script | tail -1);
if [[ $description && ${description:0:1} == '#' ]]; then
  read -p "$description #
  Enter [y] to start execution: " confirm
  etc_path=`cd $(dirname ${BASH_SOURCE})/etc; pwd`
  if [[ $confirm == 'y' ]]; then
    shift
    source $script $@
    # 检测是否需要安装
    if [[ `type before` ]]; then
      before $etc_path
      if [[ $? != 0 ]]; then
        # 开始安装
        if [[ `type setup` ]]; then
          setup $etc_path;
          # 配置完毕后的回调, 外部回调事件处理
          if [[ `type __after` ]]; then
            __after $script
          fi
          unset setup;
        fi;
      else
        echo 'The service is installed and is trying to start...'
      fi
      unset before;
      # 安装后启动服务
      if [[ `type start` ]]; then start; unset start; fi
    fi

    source ~/.bashrc # 刷新环境变量
  else
    echo 'Nothing changed'
    exit 202
  fi
else
  echo 'There are no supported scripts'
  exit 404
fi
