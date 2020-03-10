#!/usr/bin/env bash
apt update
# -------------------------------------------------------------------------
# Debian 没有预装以下软件，需要装以下软件；Ubuntu 预装了，跳过这部
# 以下软件系统没预装的话就装一个
apt -y install git
apt -y install zsh
apt -y install tmux
# 安装nc
apt -y install netcat-traditional

# -------------------------------------------------------------------------
# 所有情况都要装以下软件
# 安装vim-gnome
apt -y install vim-gnome
apy -y install python3

# 安装neovim的python依赖
apt -y install python3-pip
pip3 -y install neovim

# YouCompleteMe 的依赖 如下
# apt -y install python3 # python2,3 都装了
apt -y install build-essential cmake python3-dev

# 编译 fuzzyMatchC 的依赖
apt -y install python python-dev

# -------------------------------------------------------------------------
# zlua 的依赖
apt -y install lua5.3

# git的文本界面
# apt -y install tig
# -------------------------------------------------------------------------
# 安装nvc server及依赖
apt -y install tightvncserver xfce4 xfce4-goodies powerline fonts-powerline ttf-wqy-zenhei  autocutsel fcitx-googlepinyin
