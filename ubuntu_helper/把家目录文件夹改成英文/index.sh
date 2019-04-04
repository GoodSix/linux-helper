#!/usr/bin/env bash
read -p '请输入您当前使用的账户名' user;

mkdir /home/${user}/Desktop;
mkdir /home/${user}/Downloads;
mkdir /home/${user}/Template;
mkdir /home/${user}/Public;
mkdir /home/${user}/Document;
mkdir /home/${user}/Music;
mkdir /home/${user}/Picture;
mkdir /home/${user}/Video;

(cat <<EOF
# This file is written by xdg-user-dirs-update
# If you want to change or add directories, just edit the line you're
# interested in. All local changes will be retained on the next run.
# Format is XDG_xxx_DIR="\$HOME/yyy", where yyy is a shell-escaped
# homedir-relative path, or XDG_xxx_DIR="/yyy", where /yyy is an
# absolute path. No other format is supported.
# script by ccheng
XDG_DESKTOP_DIR="\$HOME/Desktop"
XDG_DOWNLOAD_DIR="\$HOME/Downloads"
XDG_TEMPLATES_DIR="\$HOME/Template"
XDG_PUBLICSHARE_DIR="\$HOME/Public"
XDG_DOCUMENTS_DIR="\$HOME/Document"
XDG_MUSIC_DIR="\$HOME/Music"
XDG_PICTURES_DIR="\$HOME/Picture"
XDG_VIDEOS_DIR="\$HOME/Video"
EOF
) > /home/${user}/.config/user-dirs.dirs;
echo "请重启您的电脑以生效此设置";