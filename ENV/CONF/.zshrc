#!/usr/bin/zsh
#
# zsh 的交互，加载之
# 非登录式：即，在终端下，输入`bash`，开启一个新的bash窗口，则加载之
# 登录式：zsh设置为默认shell，ssh链接服务器，则加载之
[ ! $DotFileDebug ] && DotFileDebug=0 # 若DotFileDebug未定义，则定义之
[ $DotFileDebug -ne 0 ] && echo local .zshrc >&2

[ -f $share_shell_config/.zshrc ] &&  . $share_shell_config/.zshrc

if [[ $- == *i* ]]; then
    [ $DotFileDebug -ne 0 ] &&  echo 交互模式
    [ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

