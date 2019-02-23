#!/usr/bin/zsh

echo local .zshrc

[ -f $share_shell_config/.zshrc ] &&  . $share_shell_config/.zshrc

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [[ $- == *i* ]]; then
    echo 交互模式
    [ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
fi

