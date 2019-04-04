#!/usr/bin/env bash
wget -O lnmp.gz http://soft.vpser.net/lnmp/lnmp1.5-full.tar.gz;

if [[ -f 'lnmp.gz' ]]; then
    tar -zxvf lnmp.gz;
    chmod +x lnmp1.5-full;
    lnmp1.5-full/install.sh
fi;