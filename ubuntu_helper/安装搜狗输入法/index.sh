#!/usr/bin/env bash
sudo wget -O sougoupinyin.deb http://cdn2.ime.sogou.com/dl/index/1524572264/sogoupinyin_2.2.0.0108_amd64.deb?st=kK9J8WWpnDZKwOW7-dc2xw&e=1553676731&fn=sogoupinyin_2.2.0.0108_amd64.deb;

if [[ -f sougoupinyin.deb ]]; then
    sudo dpkg -i sougoupinyin.deb;
    if ! [[ `sudo apt list fcitx-bin` ]]; then
        sudo apt install fcitx-bin;
    fi;
    echo '软件已经安装完毕，详细配置请查看 https://blog.csdn.net/Cdeeffq/article/details/88851774 ';
fi;
