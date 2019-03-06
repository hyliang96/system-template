# get absoltae path to the dir this is in, work in bash, zsh
# if you want transfer symbolic link to true path, just change `pwd` to `pwd -P`
here=$(cd "$(dirname "${BASH_SOURCE[0]-$0}")"; pwd)
. $here/install_path.sh

. $here/common_software.sh


chsh -s `which zsh` # 会要你在输入密码,故最后写这句；故请在tmux里运行此脚本，这样可以看见系统要你输密码
