#!/bin/bash

# # git clone
# cd /home/$USER
# git clone https://github.com/hyliang96/system-template.git
# cp /home/$USER/system-template/{*,.*} /home/$USER

git clone https://github.com/hyliang96/shareENV.git /home/$USER/ENV/shareENV
git clone https://github.com/hyliang96/serverENV.git /home/$USER/ENV/serverENV

# 更换链接
bash init_script/add_link.sh
# 改home，方便后面的安装
. /home/$USER/ENV/CONF/.zshenv

# 安装vim 插件
vim +BundleInstall +qall

# 更换zsh
chsh -s `which zsh`

