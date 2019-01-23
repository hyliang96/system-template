#!/bin/bash
echo lcoal .bashrc

[ -f ~/.env ] &&  . ~/.env
[ -f $share_shell_config/.bashrc ] &&  . $share_shell_config/.bashrc

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
[ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
