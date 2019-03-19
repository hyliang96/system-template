#!/bin/bash

# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh

cd $here
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
bash Anaconda3-2018.12-Linux-x86_64.sh -p $install_path/ENV/localENV/anaconda3 -b

# 安装notebook的配色
conda install -c conda-forge jupyterthemes

# 默认环境是python3.6，pip=pip3=pip3.7
pip install -U pip
pip install shadowsocks
# 安装neovim的python支持
pip install neovim

conda install -c bioconda p7zip --yes
# 装 7z, 7za, 7zr ；-yes 表示不要问yes还是no，直接装


