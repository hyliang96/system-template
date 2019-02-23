#!/usr/bin/zsh

echo .zshenv

[ -f ~/.env ] && . ~/.env

if ! [[ $- == *i* ]]; then
    echo 非交互模式
    [ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
fi

