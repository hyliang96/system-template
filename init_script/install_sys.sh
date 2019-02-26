#!/bin/bash

# # git clone
# cd /home/$USER
# git clone https://github.com/hyliang96/system-template.git
# cp /home/$USER/system-template/{*,.*} /home/$USER

git clone https://github.com/hyliang96/shareENV.git /home/$USER/ENV/shareENV
git clone https://github.com/hyliang96/serverENV.git /home/$USER/ENV/serverENV

# 更换链接
bash init_script/add_link.sh

# 安装autojump
cd $my
git clone git://github.com/joelthelion/autojump.git
cd autojump
./install.py
cd ..
rm autojump -rf

. /home/$USER/ENV/CONF/.zshenv
. /home/$USER/ENV/CONF/.zshrc
# echo `zsh`

# 安装我的agnoster
rm ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes/{agnoster.zsh-theme,agnoster.zsh-theme.antigen-compat}
ln -s $shareENV/shell_config/{agnoster.zsh-theme,agnoster.zsh-theme.antigen-compat} ~/.antigen/bundles/robbyrussell/oh-my-zsh/themes

# 安装vim 插件
vim +BundleInstall +qall

# 更换zsh
chsh -s `which zsh`

