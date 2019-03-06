#!/bin/bash
[ $DotFileDebug -ne 0 ] && echo lcoal .bashrc

# bash的交互 加载之

# bash 的非登录式 交互，直接加载之
# 即，在终端下，输入`bash`，开启一个新的bash窗口，则加载之

# bash 的 登录式，加载~/.profile, 在其中  . ~/.bashrc

# 登录式bash
if [[ $0 = -* ]]; then
    [ $DotFileDebug -ne 0 ] && echo 登录式bash
else
    [ $DotFileDebug -ne 0 ] && echo 非登录式bash
    [ -f ~/.bash_env ] &&  . ~/.bash_env
fi

[ -f $share_shell_config/.bashrc ] &&  . $share_shell_config/.bashrc

if ! [[ $- != *i* ]]; then
    [ $DotFileDebug -ne 0 ] && echo 交互模式
    [ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
fi

