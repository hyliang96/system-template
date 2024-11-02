#!/bin/bash

# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh

cd $here
# wget https://repo.continuum.io/archive/Anaconda3-2018.12-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -p $install_path/ENV/localENV/anaconda3 -b

# 若在墙内就启用tuna一键换源的脚本：目前支持更改下列软件的配置，将其直接指向 TUNA 镜像站: conda, Homebrew, PyPI(即pip源), TeX Live (by tlmgr), Arch Linux, CTAN, Debian, Ubuntu, CentOS, AOSC OS
if [ "$(timeout 5 curl -s www.google.com)" = '' ]; then
    wget --no-check-certificate -O - https://tuna.moe/oh-my-tuna/oh-my-tuna.py | python -- -
fi

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
