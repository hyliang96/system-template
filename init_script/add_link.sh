#!/bin/bash

# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh


rm $install_path/ENV/CONF/{.gitignore_global,.gitconfig,.ipython,.jupyter,.tmux.conf,.vimrc.bundles,.vim,.vimrc,.shadowsocks,.env}

ln -s $install_path/ENV/shareENV/app_config/{.gitignore_global,.gitconfig,.ipython,.jupyter,.tmux.conf,vim/.vimrc.bundles,vim/.vim,vim/.vimrc} $install_path/ENV/CONF/


ln -s $install_path/ENV/serverENV/app_config/.shadowsocks/ $install_path/ENV/CONF/
ln -s $install_path/ENV/CONF/.shell_config/.env $install_path/ENV/CONF/

