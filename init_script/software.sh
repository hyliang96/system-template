#!/bin/bash


# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh
# cd $here

echo 'modes:'
echo '    default: only install vim bundles and change default shell to zsh, 如用于搭建科学上网的vps'
echo '    cpu: for scientific computing. install "default" and anaconda, jupyter'
echo '    gpu: for deep learning. install "cpu" and torch, tensorflow'
while true; do
    echo -n 'select mode:'; read mode; echo
    if [ "$mode" = 'default' ] || [ "$mode" = 'cpu' ] || [ "$mode" = 'gpu' ]; then
        break
    else
        echo 'mode can only be in [default, cpu, gpu]!'
    fi
done

if [ $mode = cpu ] || [ $mode = gpu ]; then

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
    mkdir ${install_path}/ENV/localENV/log/{polipo,shadowsocks}
    # 安装neovim的python支持
    pip install pynvim # neovim is already renamed as pynvim

    # conda install -c bioconda p7zip --yes
    # 装 7z, 7za, 7zr ；-yes 表示不要问yes还是no，直接装
fi


if [ $mode = gpu ] then
    pip install torch torchvision
    pip install tensorflow
fi


# 安装梯子
# pip install shadowsocks

# 安装vim 插件
# vim +PlugInstall +qall

# 安装vim插件
vim -u ${install_path}/ENV/CONF/.vimrc.bundles +'PlugInstall --sync' +'PlugUpdate' +qa
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


# 会要你在输入密码,故最后写这句；故请在tmux里运行此脚本，这样可以看见系统要你输密码
# chsh -s <shell可执行文件>
# <shell可执行文件>:
#   可以是zsh,bash,rbash,ksh,tmux,screen 等等
#   只有记录在 /etc/shells 文件内的，才能成功变更默认shell，否则会报错：
#       chsh: $my/ENV/localENV/anaconda3/bin/zsh is an invalid shell
chsh -s `which zsh` || { conda install conda-forge::zsh && \
    cat << EOF
在没有管理员权限的服务器上，没安装zsh，且我作为普通用户无法apt install zsh, 因而 /etc/shells 没记录/bin/zsh。此时只能用conda安装zsh，但这个zsh因为也没记录在/etc/shells，需要在用来登陆它的本地~/.ssh/config 中设置：
Host <服务器名>
   RequestTTY force
   # 登陆时自动显示系统信息、自动启动zsh
   RemoteCommand  run-parts /etc/update-motd.d; \$HOME/ENV/localENV/anaconda3/bin/zsh -l
EOF
}

unset -v here

# 初次登录zsh以便安装zsh的插件
zsh

