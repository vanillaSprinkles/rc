#!/bin/bash

#[[ $TERM == "xterm-termite" ]] && [[ ! -f /usr/share/terminfo/${TERM:0:1}/${TERM} ]] && export TERM="xterm-256color"

[[ ! -f /usr/share/terminfo/${TERM:0:1}/${TERM} ]] &&  export TERM="xterm-256color"


