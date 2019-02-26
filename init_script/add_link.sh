#!/bin/bash

rm /home/$USER/ENV/CONF/{.gitignore_global,.gitconfig,.ipython,.jupyter,.tmux.conf,.vimrc.bundles,.vim,.vimrc,.shadowsocks,.autojump,.env}

ln -s /home/$USER/ENV/shareENV/app_config/{.gitignore_global,.gitconfig,.ipython,.jupyter,.tmux.conf,vim/.vimrc.bundles,vim/.vim,vim/.vimrc} /home/$USER/ENV/CONF/


ln -s /home/$USER/ENV/serverENV/app_config/.shadowsocks/ /home/$USER/ENV/CONF/
ln -s /home/$USER/ENV/shareENV/shell_config/.autojump/ /home/$USER/ENV/CONF/
ln -s /home/$USER/ENV/CONF/.shell_config/.env /home/$USER/ENV/CONF/

