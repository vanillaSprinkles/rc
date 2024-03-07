#!/bin/bash

#ID_DSA=1
#ID_RSA=1
echo -n "load sshkeys (y/n/<command>): " >&2
read -t 3 ans
[[ $? != 0 ]] && echo "source ~/.bashrc to load sshkeys" && return 1
if [[ "${ans,,}" == 'y' ]]; then
  ID_RSA=1
  ID_DSA=1
elif [[ "${ans,,}" == 'n' ]]; then
  return 1
else
  eval ${ans}
  return 1
fi


function askKey(){
  echo -n "Enable Pivate Key '$1' (y/n): " >&2
  read ans
  [[ ${ans,,} == 'y' ]] && return 0 || echo "poop" && return 1
}

[[ $(pgrep ssh-agent | wc -l) == 0 ]] && eval $(ssh-agent)

if [ ${ID_DSA} == 1 ]; then
  for x in $(find ~/.ssh/ -iname "*dsa*.pub"); do
    y="${x##*/}"
    priv=${y%%.*}
    askKey $priv
    if [[ "$?" == 0 ]]; then
      [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
      /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
    fi
  done
fi

if [ ${ID_RSA} == 1 ]; then
  for x in $(find ~/.ssh/ -iname "*rsa*.pub"); do
    y="${x##*/}"
    priv=${y%%.*}
    askKey $priv
    if [[ "$?" == 0 ]]; then
      [ -f /usr/bin/keychain ] && /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
      /usr/bin/keychain -Q -q --nogui ~/.ssh/${priv}
    fi
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


