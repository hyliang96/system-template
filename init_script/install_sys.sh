#!/bin/bash

echo -n 'Your User '
# 更换zsh
chsh -s `which zsh`

echo -n 'Github Password: ' ; read -s github_passwd ; echo
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

# 更换链接
# bash $here/add_link.sh
# 改home，方便后面的安装
.  $install_path/ENV/CONF/.zshenv

git clone https://hyliang96:${github_passwd}@github.com/hyliang96/serverENV_private.git  $serverENV/serverENV_private
git clone https://github.com/hyliang96/sublimy-vim.git  $shareENV/app_config/vim
git clone https://github.com/hyliang96/admin_tool.git $serverENV/admin_tool

# 从https换成ssh的url，方便之后免密push和pull
cd /home/${USER}
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
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
# 将github的公钥添加到本地
ssh-keyscan -t rsa -H github.com >> ~/.ssh/known_hosts


.  $install_path/ENV/CONF/.zshenv
# 安装vim 插件
# vim +PlugInstall +qall

# 安装vim插件
vim -u ~/.vimrc.bundles +'PlugInstall --sync' +'PlugUpdate' +qa
# nvim  -u ~/.vimrc.bundles  +'PlugInstall --sync' +'PlugUpdate' +qa
# 会自动安装各个插件，其中YouCompleteMe需要编译，会自动完成，编译无需sudo权限
# 编译nvim的YouCompleteMe, 不需要事先安装nvim的python支持 `pip install pynvim`
    # 编译无需此python支持，但使用YouCompleteMe需要
# 其编译依赖：cmake，build-essential，python-dev
    # 若缺，可根据报错情管理员安装之
    # sudo apt-get install cmake
    # sudo apt-get install build-essential
    # sudo apt-get install python python-dev
    # 然后删除~/.vim/plugged/YouCompleteMe/ 文件夹,
    # 重新执行 `vim +PlugInstall +qall`或 `$install_path/ENV/serverENV/nvim/usr/bin/nvim  +'PlugInstall --sync' +'PlugUpdate' +qa`，以编译YouCompleteMe

unset -v here



# 初次登录zsh以便安装zsh
zsh

