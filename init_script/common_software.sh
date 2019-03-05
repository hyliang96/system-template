#!/bin/bash
cd /home/${USER}/init_script
wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
bash Anaconda3-2018.12-Linux-x86_64.sh -p /home/${USER}/ENV/localENV/anaconda3 -b
# 默认环境是python3.6，pip=pip3=pip3.7
pip install -U pip
pip install shadowsocks
# 安装neovim的python支持
pip install neovim

conda install -c bioconda p7zip --yes
# 装 7z, 7za, 7zr ；-yes 表示不要问yes还是no，直接装


