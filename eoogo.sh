#!/usr/bin/env bash
:<<EOF
    script by
    github:         eoogo
    google email:   my4cheng@gmail.com
    qq email:       1434389213@qq.com
EOF

sys=`awk -F= '/^NAME/{print $2}' /etc/os-release`;
sys=${sys:1:-1};
help=`which $0`;
help=${help%/*};

# 获取对应系统的脚本
case $sys in
    'Ubuntu'):
        helper="$help/ubuntu";
    ;;
    'CentOS Linux'):
        helper="$help/centos";
    ;;
esac;

script=`find $(dirname ${BASH_SOURCE}) -name "*$1*" | head -1`;
description=$(cat $script | tail -1);
if [[ $script && ! -z $description ]]; then
  read -p "Whether to perform operation $description (y confirmation): " confirm
  if [[ $confirm -eq 'y' ]]; then
    shift
    $script $@
  else
    exit 202;
  fi
else
  echo 'There is no executable script';
  exit 404;
fi