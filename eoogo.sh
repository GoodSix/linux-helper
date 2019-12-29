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
        helper="$help/ubuntu";
    ;;
    'CentOS Linux'):
        helper="$help/centos";
    ;;
esac;

# 当前执行的脚本绝对位置
script=`find $helper/ -name "$1.sh" | head -1`;
if [[ ! $script ]]; then script=`find $helper/ -name "$1*.sh" | head -1`; fi
if [[ ! $script ]]; then echo 'There is no executable script'; exit 404; fi

description=$(cat $script | tail -1);
if [[ $description && ${description:0:1} == '#' ]]; then
  read -p "Whether to perform operation
   $description #
   y confirmation: " confirm
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
          unset setup;
        fi;
      else
        echo 'The service is installed and is trying to start...'
      fi
      unset before;
    fi
    # 启动服务
    if [[ `type start` ]]; then start; unset start; fi

    if [[ `type __after` ]]; then
      __after $script # 脚本执行完毕后的回调, 外部回调
    fi
  else
    echo 'Nothing changed'
    exit 202
  fi
else
  echo 'There are no supported scripts'
  exit 404
fi
