#!/bin/bash

ID_DSA=1
ID_RSA=1

[[ $(pgrep ssh-agent | wc -l) == 0 ]] && eval $(ssh-agent)

if [ ${ID_DSA} == 1 ]; then
  for x in $(find ~/.ssh/ -iname "*dsa*.pub"); do
    y="${x##*/}"
    priv=${y%%.*}
    [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
    /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
  done
fi

if [ ${ID_RSA} == 1 ]; then
  for x in $(find ~/.ssh/ -iname "*rsa*.pub"); do
    y="${x##*/}"
    priv=${y%%.*}
    [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
    /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
  done
fi

#if [ ${ID_DSA} == 1 ] && [ -f ~/.ssh/id_dsa ]; then
#    [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/id_dsa
#    /usr/bin/keychain -Q -q --nogui ~/.ssh/id_dsa
#fi

#if [ ${ID_RSA} == 1 ] && [ -f ~/.ssh/id_rsa ]; then
#    [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/id_rsa
#    /usr/bin/keychain -Q -q --nogui ~/.ssh/id_rsa
#fi

[ -f $HOME/.keychain/$HOSTNAME-sh ] && source $HOME/.keychain/$HOSTNAME-sh
