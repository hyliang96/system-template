#!/usr/bin/zsh

[ $DotFileDebug -ne 0 ] && echo .zlogout >&2

[ -f ~/.shell_config/.logout ] && . ~/.shell_config/.logout
