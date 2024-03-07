#!/bin/bash

# tmux
function tmux_ () {
  TMUX_BIN=/usr/bin/tmux
  MSG=$( ${TMUX_BIN} "${@}" )
  if [[ "${MSG:0:25}" == "Cannot open your terminal" ]]; then
      CMD="'tmux ${@}'"
      eval script /dev/null -c ${CMD} 
  else
      echo -e "${MSG}"
  fi
}

alias tm='tmux'
alias tmN='tmux new -s'
alias tmn='tmN'
alias tmA='tmux attach -t'
alias tma='tmA'
alias tmS='tmux switch -t'
alias tms='tmS'
alias tmLs='tmux list-sessions'
alias tmls='tmLs'
alias tmD='tmux detach'
alias tmd='tmD'
alias tmK='tmux kill-session -t'
