#!/bin/bash

# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh

# # git clone
# cd $install_path
# git clone https://github.com/hyliang96/system-template.git
# cp  $install_path/system-template/{*,.*} $install_path

git clone https://github.com/hyliang96/shareENV.git  $install_path/ENV/shareENV
git clone https://github.com/hyliang96/serverENV.git  $install_path/ENV/serverENV

# 更换链接
bash $here/add_link.sh
# 改home，方便后面的安装
.  $install_path/ENV/CONF/.zshenv

# 从https换成ssh的url，方便之后免密push和pull
cd $shareENV
git remote set-url origin git@github.com:hyliang96/shareENV
cd $serverENV
git remote set-url origin git@github.com:hyliang96/serverENV
cd $install_path

# 创建ssh密钥
mkdir ~/.ssh
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
# 将github的公钥添加到本地
ssh-keyscan -t rsa -H github.com >> ~/.ssh/known_hosts

# 安装vim 插件
# url -fLo ~/.vim/autoload/plug.vim --create-dirs \
        # https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall +qall
$install_path/ENV/serverENV/nvim/usr/bin/nvim  +'PlugInstall --sync' +'PlugUpdate' +qa
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

