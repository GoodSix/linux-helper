#!/usr/bin/env bash
read -p '请输入安装位置：' path;
git clone https://github.com/cytle/wechat_web_devtools.git ${path};
ln -s ${path}/bin/wxdt /usr/local/bin/wechat-devtools
echo "已安装至${path}, 如需启动请按下 alt + f2 输入\"wechat-devtools\"启动";