#!/usr/bin/zsh

# 一切zsh使用，都加载之
DotFileDebug=0

[ $DotFileDebug -ne 0 ] && echo .zshenv

[ -f ~/.env ] && . ~/.env


