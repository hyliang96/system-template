#!/usr/bin/env bash

# 整个系统修改
date -R # 再次查看时间
# `tzselect` 命令,一路选地区,获得时区名称 "Asia/Shanghai"
cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
date -R # 再次查看时间，确认已经修改为北京时间
hwclock --systohc # 修改硬件CMOS的时间，不然后面时间还是不准


# 安装rg, 升级vim 所需的源
# add-apt-repository -y ppa:x4121/ripgrep
# sudo add-apt-repository -y ppa:jonathonf/vim

apt update
apt -y upgrade
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
# 升级vim
apt -y install vim

# 安装neovim
apt -y install neovim

# 安装neovim的python依赖
apt -y install python3
apt -y install python3-pip
ln -s /usr/bin/pip3 /usr/bin/pip
sudo pip3 install pynvim # neovim is renamed as pynvim

# YouCompleteMe 的依赖 如下
# apt -y install python3 # python2,3 都装了
apt -y install build-essential cmake python3-dev

# 编译 fuzzyMatchC 的依赖: 不需要再装python和python-dev了，因为上面装过python3和python3-dev了
# apt -y install python python-dev

# 安装 rg
apt -y install ripgrep

# -------------------------------------------------------------------------
# zlua 的依赖
apt -y install lua5.3

# git的文本界面
# apt -y install tig
# -------------------------------------------------------------------------
# 安装nvc server及依赖
apt -y install tightvncserver xfce4 xfce4-goodies powerline fonts-powerline ttf-wqy-zenhei  autocutsel fcitx-googlepinyin
