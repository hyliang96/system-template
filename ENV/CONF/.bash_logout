#!/bin/bash

[ $DotFileDebug -ne 0 ] && echo bash_logout

[ -f ~/.shell_config/.logout ] && . ~/.shell_config/.logout
