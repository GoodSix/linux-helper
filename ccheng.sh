#!/usr/bin/env bash
:<<EOF
    script by
    github:         GoodSix
    google email:   my4cheng@gmail.com
    qq email:       1434389213@qq.com
EOF

sys=`awk -F= '/^NAME/{print $2}' /etc/os-release`;
sys=${sys:1:-1};
helper=`which $0`;
helper=${helper%/*};

case $sys in
    'Ubuntu'):
        helper="$helper/ubuntu_helper";
    ;;
    'CentOS Linux'):
        helper="$helper/centos_helper";
    ;;
esac;


if ! [[ ${helper} ]]; then
    echo '抱歉，暂时无法在这个系统上运行
    ';
    exit;
elif [[ $# -lt 1 ]]; then
    echo '您可以告诉我您遇到的问题，我会尽量帮助您解决。
    ';
    exit;
elif ! [[ -r ${helper} ]]; then
    echo '遇到问题了吗？';
    echo '如果你有需要，我就在
    my4cheng@gmail.com || 1434389213@qq.com';
    exit;
elif [[ `whoami` != 'root' ]]; then
    echo '如果您要继续，必须切换至root身份执行
    ';
    exit;
else
    clear;
    ls=`ls ${helper} helper | grep $1`;
    if ! [[ ${ls} ]]; then
        ls=`ls ${helper} helper`;
        echo '没有找到您需要的东西，但是我可以帮助您：';
    fi;
    i=0;
    com='';
    for l in ${ls}; do
        if [[ `echo ${l} | grep -v ':'` ]]; then
            echo "${i}  ${l}";
            com[${i}]=${l};
            ((i++));
        fi;
    done;

    read -p '请输入您需要执行操作的编号：' in ;

    com="${com[${in}]}";
    if [[ ${com} ]]; then
        ec="${helper}/${com[${in}]}/index.sh";
        clear;
        if ! [[ -r ${ec} ]]; then
            ec="helper/${com[${in}]}/index.sh";
        fi;
        cat ${ec};
        echo '';
        read -p '即将为您执行以上操作，请输入y确认:' in;
        if [[ ${in} == 'y' ]]; then
            source ${ec};
        fi;
    else
        echo '无法执行此操作';
        exit 1;
    fi;
    unset ec;
    unset com;
    unset in;
    unset ls;
fi;

unset helper;