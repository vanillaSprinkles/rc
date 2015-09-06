#!/bin/bash

#[[ $TERM == "xterm-termite" ]] && [[ ! -f /usr/share/terminfo/${TERM:0:1}/${TERM} ]] && export TERM="xterm-256color"

##export TERM="konsole-256color"
#export TERM="xterm-256color"
##export TERM="screen-256color"

if [ "$TERM" = linux ]; then
    eval $(dircolors);
#elif [ "$TERM" = vt220 ]; then
#    ls () { command ls -F $* ; }$to export the function ls():
#    declare -xf ls
#else echo "From /etc/profile: Unknown terminal type $TERM"
fi

[[ ! -f /usr/share/terminfo/${TERM:0:1}/${TERM} ]] &&  export TERM="xterm-256color"

eval $(dircolors)
