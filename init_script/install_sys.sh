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

# 从https换成ssh的url，方便之后免密push和pull
cd $shareENV
git remote set-url origin git@github.com:hyliang96/shareENV
cd $serverENV
git remote set-url origin git@github.com:hyliang96/serverENV
cd /home/$USER

# 创建ssh密钥
mkdir ~/.ssh
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
# 将github的公钥添加到本地
ssh-keyscan -t rsa -H github.com >> ~/.ssh/known_hosts

# 安装vim 插件
url -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
# 会自动安装各个插件，其中YouCompleteMe需要编译，会自动完成，编译无需sudo权限
# 其编译依赖：cmake，build-essential，python-dev
# 若缺，可根据报错情管理员安装之
# sudo apt-get install cmake
# sudo apt-get install build-essential
# sudo apt-get install python python-dev
# 然后重新`vim +PlugInstall +qall`，以编译YouCompleteMe

# 更换zsh
chsh -s `which zsh`

# 初次登录zsh以便安装zsh
zsh

