# echo $(dirname "$0")
echo $-
if [[ -o login ]]; then  echo zsh login; else echo not zsh login; fi
echo ${BASH_SOURCE[0]-$0}


echo '${BASH_SOURCE[0]}:' ${BASH_SOURCE[0]}
echo '$0:'  $0
echo '$0minus:' ${0-${BASH_SOURCE[0]}}
if [[ $(shopt login_shell) = *on ]]; then echo yes; else echo no; fi
