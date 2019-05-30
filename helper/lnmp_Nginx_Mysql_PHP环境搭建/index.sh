#!/usr/bin/env bash
cd;
git clone https://github.com/licess/lnmp.git lnmp;

if [[ -d 'lnmp' ]]; then
    cd lnmp;
    chmod +x *;
    ./install.sh;
fi;
