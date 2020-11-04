#!/bin/bash

# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh

cd $here
# wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -p $install_path/ENV/localENV/anaconda3 -b

# 安装notebook的配色
# conda install -c conda-forge jupyterthemes

# 默认环境是python3.6，pip=pip3=pip3.7
pip install -U pip

pip install pretty_errors && \
python -m pretty_errors -s -p
pretty_errors_config="$(py -m pretty_errors -f | grep pretty_errors.pth)"
[ -f "$pretty_errors_config" ] && ln -sf $shareENV/app_config/pretty_errors.pth "$pretty_errors_config"

# -s: 装在system的python下, 但此处system的Python被劫持为conda的Python
# -p: 装到<path_to_python>/lib/pythonx.x/site-packages/pretty_errors.pth
# 卸载pretty_errors: `python -m pretty_errors -c && pip uninstall pretty_errors`

pip install jupyter
pip install jupyterthemes
pip install shadowsocks
mkdir /home/${USER}/ENV/localENV/log/{polipo,shadowsocks}
# 安装neovim的python支持
pip install pynvim # neovim is renamed as pynvim

# conda install -c bioconda p7zip --yes
# 装 7z, 7za, 7zr ；-yes 表示不要问yes还是no，直接装

unset -v here
