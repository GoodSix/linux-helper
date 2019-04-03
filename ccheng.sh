#!/usr/bin/env bash
:<<EOF
    script by
    github:         GoodSix
    google email:   my4cheng@gmail.com
    qq email:       1434389213@qq.com
EOF

# 工具包目录
help='helper';
if [[ $# -lt 1 ]]; then
    echo "您可以告诉我您遇到的问题，我会尽量帮您解决一些问题。";
    echo '';
    exit;
elif ! [[ -r ${help} ]]; then
    echo '遇到问题了吗？';
    echo '如果你有需要，我就在 my4cheng@gmail.com || 1434389213@qq.com';
    exit;
else
    clear;
    ls=`ls ${help} | grep $1`;
    if ! [[ ${ls} ]]; then
        ls=`ls ${help}`;
        echo '没有找到您需要的东西，但是我可以帮助您：';
    fi;
    i=0;
    com='';
    for l in ${ls}; do
        echo "${i}  ${l}";
        com[${i}]=${l};
        ((i++));
    done;

    read -p '请输入您需要执行操作的编号：' in ;

    com="${com[${in}]}";
    if [[ ${com} ]]; then
        com="${help}/${com[${in}]}/index.sh";
        clear;
        cat ${com};
        echo '';
        read -p '即将为您执行以上操作，请输入y确认:' in;
        if [[ ${in} == 'y' ]]; then
            source ${com};
        fi;
    else
        echo '无法执行此操作';
        exit 1;
    fi;

    unset com;
    unset in;
    unset ls;
fi;

unset help;