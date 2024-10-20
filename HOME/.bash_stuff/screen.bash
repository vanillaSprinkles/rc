#!/bin/bash

# screen

## screen deprecations in 5.0 (2024)
## time function
## seconds in status
## 'load' is broken

alias sN='echo tmux'
alias scls='echo tmux'
alias rx='echo tmux'
alias screen='echo tmux'



#_OFF_rip_2024_#
#_OFF_rip_2024_#SCREEN=/usr/bin/screen
#_OFF_rip_2024_#function screen () {
#_OFF_rip_2024_#  MSG=$( ${SCREEN} "${@}" )
#_OFF_rip_2024_#  if [[ "${MSG:0:25}" == "Cannot open your terminal" ]]; then
#_OFF_rip_2024_#      CMD="'screen ${@}'"
#_OFF_rip_2024_#      eval script /dev/null -c ${CMD} 
#_OFF_rip_2024_#  else
#_OFF_rip_2024_#      echo -e "${MSG}"
#_OFF_rip_2024_#  fi
#_OFF_rip_2024_#}
#_OFF_rip_2024_#
#_OFF_rip_2024_#alias sc='screen'
#_OFF_rip_2024_##alias sN='screen -S'
#_OFF_rip_2024_#function sN () {
#_OFF_rip_2024_#  now=$(date "+%s.%3N")
#_OFF_rip_2024_#  screen -S ${1:-$now}
#_OFF_rip_2024_#}
#_OFF_rip_2024_#alias srx='screen -rx'
#_OFF_rip_2024_#alias rx='screen -rx'
#_OFF_rip_2024_#alias sls='screen -ls'
#_OFF_rip_2024_#alias scls='screen -ls'
#_OFF_rip_2024_#alias sdr='screen -D -R'
#_OFF_rip_2024_#alias sdrr='screen -D -RR'
#_OFF_rip_2024_#alias rxdr='screen -D -R'
#_OFF_rip_2024_#alias rxdrr='screen -D -RR'
#_OFF_rip_2024_#

