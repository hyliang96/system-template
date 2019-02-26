. /home/${USER}/init_script/common_software.sh

pip install torch torchvision
pip install tensorflow-gpu

chsh -s `which zsh` # 会要你在输入密码,故最后写这句；故请在tmux里运行此脚本，这样可以看见系统要你输密码
