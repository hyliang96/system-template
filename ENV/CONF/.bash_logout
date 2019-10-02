#!/bin/bash

[ $DotFileDebug -ne 0 ] && echo bash_logout >&2

[ -f ~/.shell_config/.logout ] && . ~/.shell_config/.logout
