#!/usr/bin/zsh

[ $DotFileDebug -ne 0 ] && echo .zlogout

[ -f ~/.shell_config/.logout ] && . ~/.shell_config/.logout
