#!/bin/bash

uPS1='${debian_chroot:+($debian_chroot)}\[\033[01;92m\][\[\033[00;94m\]\u\[\033[00;90m\]@\h\[\033[00m\] \[\033[96m\]\w\[\033[01;92m\]]\[\033[00;31m\]\$\[\033[00m\] '

rPS1='${debian_chroot:+($debian_chroot)}\[\033[01;92m\][\[\033[00;91m\]\u\[\033[00;90m\]@\h\[\033[00m\] \[\033[96m\]\w\[\033[01;92m\]]\[\033[00;05;31m\]\$\[\033[00m\] '
uPS1='\[\033[01;92m\][\[\033[00;94m\]\u\[\033[00;90m\]@\h\[\033[00m\] \[\033[96m\]\w\[\033[01;92m\]]\[\033[00;31m\]\$\[\033[00m\] '
#            01;92   [       00;94   \u       00;90   @\h       00m  _       96m  \w       01;92   ]       00;31m  \$       00   _

## [ ] 91 => 32
## u   94 => 38 5 172   =>  38 5 104
## @ == same   90 == 90
## h (new) 90  =>  38 5 153
## \w => 96 => 38 5 214   215
## $  31 => 01;02;31  

#  for x in $(seq 1 251); do _arg="38;5;$x"; echo -e "asd   \033[${_arg}m    asds   $x  \e[0;0;m wtf"; done  | less

#            01;31   [       38 5 104   \u       00;90   @                  \h       00m  _       38 5 215m  \w       01;31   ]       00;31m  \$          00   _
uPS1='\[\033[01;31m\][\[\033[38;5;104m\]\u\[\033[00;90m\]@\[\033[38;5;153m\]\h\[\033[00m\] \[\033[38;5;215m\]\w\[\033[01;31m\]]\[\033[01;02;31m\]\$\[\033[00m\] '

#            31                 38 5 172   \u    00  @     38 5 153   \h    00  _     38 5 214   \W    00       31   ]    00    $_
# uPS1="\[\e[31m\][\[\e[m\]\[\e[38;5;172m\]\u\[\e[m\]@\[\e[38;5;153m\]\h\[\e[m\] \[\e[38;5;214m\]\W\[\e[m\]\[\e[31m\]]\[\e[m\]\\$ "  ## https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html




cPS1=""

# If not running interactively, don't do anything
[[ $- != *i* ]] && return



# PS1='[\u@\h \W]\$ '

cPS1=${uPS1}
#PS1='\[\033[01;92m\][\[\033[00;94m\]\u\[\033[00;90m\]@\h\[\033[00m\] \[\033[96m\]\w\[\033[01;92m\]]\[\033[00;31m\]\$\[\033[00m\] '
if [ $USER == "root" ]; then
cPS1=${rPS1}
fi

PS1=${cPS1}


###  window-title (putty / xterm)
function wtitle (){
#    if [ "$TERM" == "xterm" ] ; then
#        # Remove the old title string in the PS1, if one is already set.
#       PS1=`echo $cPS1 | sed -r 's/^\\\\\[.+\\\\\]//g'`
    #    export PS1="\[\033]0;$1 - \u@\h:\w\007\]${PS1}"
    oPS1="${PS1}"
    export -p PS1="\[\033]0;$1 - \u@\h:\w\007\]${PS1}"
 source ~/.bash_stuff/ps1.bash
#    PS1=${oPS1}
}
#       export PS1=${cPS1}
#    else
#      echo "You are not working in xterm. I cannot set the title."
#    fi
#}
###  end window-title

