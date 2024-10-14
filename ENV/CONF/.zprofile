#!/usr/bin/zsh

#  zsh 的登录式，则加载之
# 即，把zsh设置为默认shell `chsh -s `which zsh``
# 而后ssh登录服务器，则加载之

[ ! $DotFileDebug ] && DotFileDebug=0 # 若DotFileDebug未定义，则定义之
[ $DotFileDebug -ne 0 ] && echo .zprofile >&2
[ -f ~/.shell_config/.login ] && . ~/.shell_config/.login
