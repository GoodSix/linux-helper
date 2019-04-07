#!/usr/bin/env bash
wget -O nodejs.tar.xz https://nodejs.org/dist/v10.15.3/node-v10.15.3-linux-x64.tar.xz;
if ! [[ `unar` ]]; then
    apt install unar;
fi;
unar nodejs.tar.xz;
mv node-v10.15.3-linux-x64 /usr/local/nodejs;

cat "export PATH=\"\$PATH:/usr/local/nodejs/bin\""; >> /etc/profile;
