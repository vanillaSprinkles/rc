#!/bin/bash

# stat --printf="%A %4a %2h %-9U %-9G %5s %.19y %n\n" $(ls -a)
# stat --printf="%A\t%a\t%h\t%U\t%G\t%s\t%.19y\t%n\n" * | numfmt --to=iec-i --field=6 --delimiter=$'\t' --suffix=B
# alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
 lso() { ls -alh "$@" --color=always| awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}'; }

function llo (){
  stat --printf="%A %4a %2h %-9U %-9G %5s %.19y %n\n" $(find "$@" -maxdepth 1 -mindepth 1)  | numfmt --to=iec-i --field=6  --suffix=B
}
