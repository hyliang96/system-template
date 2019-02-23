#!/usr/bin/zsh
#
# zsh 的交互，加载之
# 非登录式：即，在终端下，输入`bash`，开启一个新的bash窗口，则加载之
# 登录式：zsh设置为默认shell，ssh链接服务器，则加载之

echo local .zshrc

[ -f $share_shell_config/.zshrc ] &&  . $share_shell_config/.zshrc

if [[ $- == *i* ]]; then
    echo 交互模式
    [ -f ~/.shell_config/.aliases ] &&  . ~/.shell_config/.aliases
fi

