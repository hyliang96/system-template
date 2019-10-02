#!/bin/bash

DotFileDebug=0

#  bash 的登录式，则加载之
# 即，把bash设置为默认shell `chsh -s `which bash``
# 而后ssh登录服务器，则加载之

[ $DotFileDebug -ne 0 ] && echo .bash_profile >&2

[ -f ~/.bash_env ] && . ~/.bash_env
[ -f ~/.shell_config/.login ] && . ~/.shell_config/.login
[ -f ~/.bashrc ] && . ~/.bashrc
