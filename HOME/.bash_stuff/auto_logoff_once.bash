#!/bin/bash
#workDir="/tmp/$(id -un)/bash_stuff"
workDir="/tmp"
tfile="${workDir}/auto_logoff_once"
tfile2="${workDir}/auto_logoff_once2"


if [[ 0 -eq 1 ]]; then
if [[ ! -e ${tfile} ]]; then
  mkdir -p $workDir
  touch $tfile  && /usr/bin/screen -S ptymade  &
  #vlock 
  #/usr/bin/screen -S ptymade
  while [ 1 ]; do
      touch $tfile
      sleep 6h
  done
  exit
#elif [[ ! -e ${tfile2} ]]; then
#  mkdir -p $workDir
#  touch $tfile2
#  exit
fi

fi
