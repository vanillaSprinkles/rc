#!/bin/bash

### needs fixing

#alias irssi='irc'

alias irc='relaunch=`screen -rx irssi`; if [ "${relaunch}"  ]; then  cd $HOME/.irssi;  screen -c $HOME/.irssi/screenIrssi -S irssi;  fi'
alias ircd='pid=`screen -ls | grep irssi | sed 's/\t*//' | cut -d '.' -f1`; if [ -z ${pid} ]; then  cd ${HOME}/.irssi; irc;  else  screen -d -RR ${pid};   fi'
alias ircD='pid=`screen -ls | grep irssi | sed 's/\t*//' | cut -d '.' -f1`; if [ -z ${pid} ]; then  cd ${HOME}/.irssi; irc;  else  screen -D -RR ${pid};   fi'


#alias ircd='relaunch=`screen -d -RR irssi`; if [ "${relaunch}"  ]; then  cd $HOME/.irssi;  screen -c $HOME/.irssi/screenIrssi -S irssi;  fi'
#alias ircD='relaunch=`screen -D -RR irssi`; if [ "${relaunch}"  ]; then  cd $HOME/.irssi;  screen -c $HOME/.irssi/screenIrssi -S irssi;  fi'
