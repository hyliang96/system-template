#!/usr/bin/zsh

#  zsh 的登录式，则加载之
# 即，把zsh设置为默认shell `chsh -s `which zsh``
# 而后ssh登录服务器，则加载之


echo .zprofile
[ -f ~/.shell_config/.login ] && . ~/.shell_config/.login
