#!/bin/bash


echo -n 'Github Token: ' ; read -s github_token ; echo
# echo -n 'User Password: ' ; read -s user_passwd ; echo

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

# 改home，方便后面的安装
.  $install_path/ENV/CONF/.env

git clone https://${github_token}@github.com/hyliang96/serverENV_private.git  $serverENV/serverENV_private
git clone https://github.com/hyliang96/sublimy-vim.git  $shareENV/app_config/vim

# 从https换成ssh的url，方便之后免密push和pull
cd "$install_path"
if [[ "$(git remote show origin)" =~ 'hyliang96/system-template.git' ]]; then
    git remote set-url origin git@github.com:hyliang96/system-template.git
fi
cd $shareENV
git remote set-url origin git@github.com:hyliang96/shareENV
cd $serverENV
git remote set-url origin git@github.com:hyliang96/serverENV
# mkdir -p $serverENV/serverENV_private
cd $serverENV/serverENV_private
git remote set-url origin git@github.com:hyliang96/serverENV_private
cd  $shareENV/app_config/vim
git remote set-url origin git@github.com:hyliang96/sublimy-vim.git
cd $serverENV/admin_tool
git remote set-url origin git@github.com:hyliang96/admin_tool.git

cd $install_path

# 创建ssh密钥
mkdir -p $install_path/ENV/CONF/.ssh
chmod 700 $install_path/ENV/CONF/.ssh
if [ ! -f $install_path/ENV/CONF/.ssh/id_rsa ]; then
    ssh-keygen -b 2048 -t rsa -f $install_path/ENV/CONF/.ssh/id_rsa -q -N ""
fi
# 将github的公钥添加到本地
ssh-keyscan -t rsa -H github.com >> $install_path/ENV/CONF/.ssh/known_hosts

unset -v here




