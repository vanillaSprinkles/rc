#!/usr/bin/env bash

###  SHLVL ?

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ] && [ -z "$BASH_STUFF_FIRST_SHELL_LOGIN" ]; then
  export IGNOREEOF=30
  export BASH_STUFF_FIRST_SHELL_LOGIN=$(date +%s)
else
    unset IGNOREEOF
fi

