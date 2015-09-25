#!/bin/bash

# stat --printf="%A %4a %2h %-9U %-9G %5s %.19y %n\n" $(ls -a)
# stat --printf="%A\t%a\t%h\t%U\t%G\t%s\t%.19y\t%n\n" * | numfmt --to=iec-i --field=6 --delimiter=$'\t' --suffix=B
# alias lso="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
 lso() { ls -alh "$@" --color=always| awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}'; }



# SYM " LINK "
# echo -e "\033[$(dircolors -p | awk '/^DIR/ {print $2}')m"
# DIR BLUE
# sed -r "s/^(-\S+\s+)((\S+\s+){7})(.*)/\1\2_\4_/"


function llo (){
  ARGS="${@}"

  local CL='\\e['
  local RS='\\e[0;0m'
  local cPR='\\033['
  local cPO='m'
  local DIR=$cPR$(dircolors -p | awk '/^DIR/ {print $2}')$cPO
  local SYM=$cPR$(dircolors -p | awk '/^LINK/ {print $2}')$cPO
  local EXE=$cPR$(dircolors -p | awk '/^EXEC/ {print $2}')$cPO
  
  [[ -n "$ARGS" ]] && pushd "$ARGS" 2>&1 >/dev/null || ARGS='.'

  oIFS=$IFS
  IFS=$'\n'
  echo -e "$(stat --printf="%A %4a %2h %-9U %-9G %5s %.19y %n\n" $(find . -maxdepth 1 -mindepth 1 -printf '%f\n' | sort -f)  | \
    numfmt --to=iec-i --field=6  --suffix=B | \
    sed -r "
     s/^(d\S+\s+)((\S+\s+){7})(.*)/\1\2${DIR}\4${RS}/;
     s/^(l\S+\s+)((\S+\s+){7})(.*)/\1\2${SYM}\4${RS}/;
     s/^((\S*x\S*)\s+)((\S+\s+){7})(.*)/\1\3${EXE}\5${RS}/;
    " )"
  IFS=$oIFS
  [[ -n "$ARGS" && "$ARGS" != '.' ]] && popd 2>&1 >/dev/null
}
#



#echo -e "$(pacman -Ss ${@} | sed "
#    /\[installed\]$/s,.*,${CL}0;33m&${RS},
#    /^core/s,.*,${CL}1;31m&${RS},
#    /^extra/s,.*,${CL}0;32m&${RS},
#    /^community/s,.*,${CL}1;35m&${RS},
#    /^[^[:space:]]/s,.*,${CL}0;36m&${RS},
#   ")"
