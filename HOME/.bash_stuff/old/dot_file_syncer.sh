#!/bin/bash

# rsync -Ltr -nv ~/.bash pub/
v=""  #"-v"
DotFiles=~/.DotFiles
PrintSYNCFiles=0
kill_index_html=1
kill_empty_dir=1
backupOldDotFiles=1
## backup old dotfiles folder
[[ $backupOldDotFiles == 1 && -d ${DotFiles} ]] && mv ${DotFiles} ${DotFiles}__pre_$(datime)

## config file $(hostname)

priv=()
privC=()
pubC=()
pub=()
IgnoreReg=("${DotFiles}")
IgnoreReg+=("\.config$")
# .config folder
pubCFG=()
privCFG=()
pubCFGc=()
privCFGc=()


IgnoreReg+=("\.adobe$")
IgnoreReg+=("\.cache$")
IgnoreReg+=("\.cdw$")
IgnoreReg+=("\.dbus$")
IgnoreReg+=("\.dvdcss$")
IgnoreReg+=("\.gstreamer.*$")
IgnoreReg+=("\.macromedia$")
IgnoreReg+=("\.bzr.\log$")
IgnoreReg+=("\.lesshst$")
IgnoreReg+=("\.pulse-cookie$")
IgnoreReg+=("\.Xauthority$")
IgnoreReg+=("\.wireshark$")

IgnoreRegCFG+=("menus$")
IgnoreRegCFG+=("Trolltech\.conf$")

pub+=(".XCompose*")
#_# pub+=("xdefaults_debian")
#_# pub+=("work_dot_files.bz2")
#_# pub+=(".Xdefaults")
#_# pub+=(".fontconfig")
pub+=(".asoundrc_gen.sh")
pub+=(".fluxbox")
pub+=(".pekwm")
pub+=(".fehbg*")
pub+=(".i3")
pub+=(".wmii-hg")
pub+=(".pulse")
pub+=(".screen*")
#_# pub+=("conky*")
#_# pub+=(".conky*")
pub+=(".bscripts")
pub+=(".gitconfig")

#pubC+=("cp -vfP" ".xinitrc")
pubC+=("rsync -ltr $v" ".xinitrc*")
#_# pubC+=("rsync -ltr $v" ".profile")
#_# pubC+=("rsync -ltr $v" ".xsession*")

# bash*  _stuff
mkdir -p ${DotFiles}/priv/.bash_stuff/
pubC+=("rsync -Ltr $v --exclude=*.bash_priv --exclude=.bash_history --exclude=index.html" ".bash*")
priv+=(".bash_history")
# rsync -cLtr $v ~/.bash_stuff/*.bash  ${DotFiles}/pub/.bash_stuff/
rsync -cLtr $v ~/.bash_stuff/*.bash_priv  ${DotFiles}/priv/.bash_stuff/

# config
pubCFG+=("bscripts")
pubCFG+=("openbox")
pubCFG+=("termite.cfg*")
pubCFG+=("vlc")

privCFG+=("Clementine")
privCFG+=("chromium")
privCFG+=("dwb")
privCFG+=("gtk*")


priv+=(".elinks")
priv+=(".emacs.d")
priv+=(".esd_auth")
priv+=(".gtkhxrc")
#_# priv+=(".keychain")
#_# priv+=(".lftp")
#_# priv+=(".links")
priv+=(".local")
#_# priv+=(".microdc2")
priv+=(".mozilla")
priv+=(".mplayer")
#_# priv+=(".ncdc")
priv+=(".netrc")
priv+=(".nero")
priv+=(".pki")
#_# priv+=(".rnd")
priv+=(".ratpoison_history")
#_# priv+=(".rtorrent.rc")
priv+=(".sqlite_history")
priv+=(".ssh")
#_# priv+=(".todo")
#_# priv+=(".vnc")

#_# privC+=("rsync -cltr $v --specials --exclude=_SRC" ".irssi")





### the fun starts here, dont edit below this line ###
######################################################
IgnoreReg+=("\.gitconfig$")

## dot files sync'd (and theoretically Ignored)
dotFiles=()
dotFilesCFG=()

# const excludes
exclusions="--exclude=.pulse/*-runtime --exclude=*~"
exclusionsCFG="--exclude=dwb-uni.fifo  --exclude=*~  --exclude SingletonLock --exclude SingletonCookie --exclude SingletonSocket"


sz_privC=${#privC[@]}
for ((itr=0;itr<sz_privC;itr++)); do
  # 0  command +1  file
    if (( $itr %  2 == 0 )); then
	${privC[$itr]}  $exclusions  ~/${privC[$((itr+1))]}   ${DotFiles}/priv/
	dotFiles+=("${privC[$((itr+1))]}")
    fi
done


sz_priv=${#priv[@]}
for ((itr=0;itr<sz_priv;itr++)); do
    rsync -cLtr $v  $exclusions  ~/${priv[$itr]}   ${DotFiles}/priv/
    dotFiles+=("${priv[$itr]}")
done


sz_pubC=${#pubC[@]}
for ((itr=0;itr<sz_pubC;itr++)); do
    if (( $itr % 2 == 0 )); then
	${pubC[$itr]}  $exclusions   ~/${pubC[$((itr+1))]}   ${DotFiles}/pub/
	dotFiles+=("${pubC[$((itr+1))]}")
    fi
done


sz_pub=${#pub[@]}
for ((itr=0;itr<sz_pub;itr++)); do
    rsync -cLtr $v  $exclusions  ~/${pub[$itr]}   ${DotFiles}/pub/
    dotFiles+=("${pub[$itr]}")
done



# .config folder rsync's
sz_pubCFG=${#pubCFG[@]}
mkdir -p ${DotFiles}/pub/.config
for ((itr=0;itr<sz_pubCFG;itr++)); do
    rsync -cLtr $v  $exclusionsCFG  ~/.config/${pubCFG[$itr]}   ${DotFiles}/pub/.config/
    dotFilesCFG+=("${pubCFG[$itr]}")
done

sz_privCFG=${#privCFG[@]}
mkdir -p ${DotFiles}/priv/.config
for ((itr=0;itr<sz_privCFG;itr++)); do
    rsync -cLtr $v  $exclusionsCFG  ~/.config/${privCFG[$itr]}  ${DotFiles}/priv/.config/
    dotFilesCFG+=("${privCFG[$itr]}")
done

sz_pubCFGc=${#pubCFGc[@]}
mkdir -p ${DotFiles}/pub/.config
for ((itr=0;itr<sz_pubCFGc;itr++)); do
    if (( $itr % 2 == 0 )); then
	echo "stub:  pubCFGc"
#	${pubCFGc[$itr]}  $exclusionsCFG  ~/.config/${pubCFGc[$((itr+1))]}   ${DotFiles}/pub/.config/
#	dotFilesCFG+=("${pubCFGc[$((itr+1))]}")
    fi
done

sz_privCFGc=${#privCFGc[@]}
mkdir -p ${DotFiles}/priv/.config
for ((itr=0;itr<sz_privCFGc;itr++)); do
    if (( $itr % 2 == 0 )); then
	echo "stub:  privCFGc"
#	${privCFGc[$itr]}  $exclusionsCFG  ~/.config/${privCFGc[$((itr+1))]}   ${DotFiles}/priv/.config/
#	dotFilesCFG+=("${privCFGc[$((itr+1))]}")
    fi
done
# end .config folder rsync's



## convert sync'able dot-files to RegEx
sz_dotFiles=${#dotFiles[@]}
sz_dotFilesCFG=${#dotFilesCFG[@]}
dfR=()
dfRCFG=()
if [[ ${PrintSYNCFiles} == 1 ]]; then
    echo -e "\nsync'ing:"
    rm -f /tmp/dotfilesyncerouts.dunnos
    rm -f /tmp/dotfilesyncerouts.ignores
    rm -f /tmp/dotfilesyncerouts.syncing
fi
for (( itr=0;itr<sz_dotFiles;itr++ )); do
    tmp="${dotFiles[$itr]/$'.'/\\.}"
    tmp2="${tmp/$'\*'/.*}"'$'
    if [[ ${PrintSYNCFiles} == 1 ]]; then
	echo " ${tmp2}" >> /tmp/dotfilesyncerouts.syncing
    fi
    dfR+=( ${tmp2} )
done
# .config syncing list
for (( itr=0;itr<sz_dotFilesCFG;itr++ )); do
    tmp="${dotFilesCFG[$itr]/$'.'/\\.}"
    tmp2="\.config/${tmp/$'\*'/.*}"'$'
    if [[ ${PrintSYNCFiles} == 1 ]]; then
	echo " ${tmp2}" >> /tmp/dotfilesyncerouts.syncing
    fi
    dfRCFG+=( ${tmp2} )
done


if [[ ${PrintSYNCFiles} == 1 ]]; then
    sort /tmp/dotfilesyncerouts.syncing
    echo -e  $(($sz_dotFiles+$sz_dotFilesCFG))
    echo -e "\nIgnore'ing:"
    
fi

## add IgnoreReg to RegEx array: dfR
sz_ignores=${#IgnoreReg[@]}
sz_ignoresCFG=${#IgnoreRegCFG[@]}

for ((itr=0;itr<sz_ignores;itr++)); do
    dfR+=( "${IgnoreReg[$itr]}" )
done
for ((itr=0;itr<sz_ignoresCFG;itr++)); do
    dfRCFG+=( "\.config/${IgnoreRegCFG[$itr]}" )
done

if [[ ${PrintSYNCFiles} == 1 ]]; then
    for ((itr=0;itr<sz_ignores;itr++)); do
	echo  " ${IgnoreReg[$itr]}" >> /tmp/dotfilesyncerouts.ignores
    done
    for ((itr=0;itr<sz_ignoresCFG;itr++)); do
	echo  " \.config/${IgnoreRegCFG[$itr]}" >> /tmp/dotfilesyncerouts.ignores
    done
    sort /tmp/dotfilesyncerouts.ignores
    rm -f /tmp/dotfilesyncerouts.ignores
    echo $(($sz_ignores+$sz_ignoresCFG))
fi
## rsync + ignores file lists as RegEx
sz_r=${#dfR[@]}
sz_rCFG=${#dfRCFG[@]}



function remel(){
# http://www.tech-recipes.com/rx/910/bash-array-operations/
    array=( $@ )
    let ind=${#array[@]}-1
    i=${array[$ind]}
    unset array[$ind]
    if [ $i -ne 0 ]; then
	array=( ${array[@]:0:$i} ${array[@]:$(($i + 1))} )
    else
	array=( ${array[@]:$(($i + 1))} )
    fi
    echo ${array[@]}
}



### find all dot-files, blank out sync'd files
allDotFiles=(`find -L ~/ -maxdepth 1  -name ".*" | grep -v ".config"`)
#allDotFiles=(`remel ${allDotFiles[@]} ".config"`)
sz_allDF=${#allDotFiles[@]}
for (( itr=0;itr<sz_allDF;itr++ )); do

    for (( i=0; i<sz_r; i++ )); do
	if [[ "${allDotFiles[$itr]}" =~ ${dfR[$i]} ]]; then
	    allDotFiles[$itr]=""
	    i=sz_r
	fi
    done
done
# find all files/folders in .config, blank out sync'd ones
allCFGFiles=(`find -L ~/.config -maxdepth 1 -name "*" | grep -v ".config$"`)
sz_allDF_CFG=${#allCFGFiles[@]}
for (( itr=0;itr<sz_allDF_CFG;itr++ )); do
    for (( i=0; i<sz_rCFG; i++ )); do
#	echo "${allCFGFiles[$itr]}   =~   ${dfRCFG[$i]} "
	if [[ "${allCFGFiles[$itr]}" =~ ${dfRCFG[$i]} ]]; then
	    allCFGFiles[$itr]=""
	    i=sz_rCFG
	fi
    done
done


### clean up all dot-files -> now are list of not sync'd
for (( itr=sz_allDF; itr >= 0; itr-- )); do
    if [[ "${allDotFiles[$itr]}" == "" ]]; then
	allDotFiles=(`remel ${allDotFiles[@]}  ${itr}`)
    fi
done
#.config folder
for (( itr=sz_allDF_CFG; itr >= 0; itr-- )); do
    if [[ "${allCFGFiles[$itr]}" == "" ]]; then
	allCFGFiles=(`remel ${allCFGFiles[@]}  ${itr}`)
    fi
done


## print out the not-specified list
sz_allDF=${#allDotFiles[@]}
sz_allDF_CFG=${#allCFGFiles[@]}
if [[ ${PrintSYNCFiles} == 1 ]]; then
    echo -e "\n\nnot specified:"
    for (( itr=0;itr<sz_allDF;itr++ )); do
	echo " ${allDotFiles[$itr]}" >> /tmp/dotfilesyncerouts.dunnos
    done
    for (( itr=0;itr<sz_allDF_CFG;itr++ )); do
	echo " ${allCFGFiles[$itr]}" >> /tmp/dotfilesyncerouts.dunnos
    done
    sort /tmp/dotfilesyncerouts.dunnos
    rm -f /tmp/dotfilesyncerouts.dunnos
    echo -e "$(($sz_allDF+$sz_allDF_CFG))"
fi



### sync the non-specified to priv_nonSpecified
for (( itr=0; itr< sz_allDF; itr++ )); do
    rsync -cltr  ${allDotFiles[$itr]}  ${DotFiles}/priv_nonSpecified/
done
#.config folder
mkdir -p ${DotFiles}/priv_nonSpecified/.config
for (( itr=0; itr< sz_allDF_CFG; itr++ )); do
    rsync -cltr  ${allCFGFiles[$itr]}  ${DotFiles}/priv_nonSpecified/.config/
done

#touch ${DotFiles}/.gitignore
echo -e "priv\npriv_nonSpecified\n*_priv\n*~" > ${DotFiles}/.gitignore
chmod 644 ${DotFiles}/.gitignore


if [[ ${kill_index_html} == 1 ]]; then
    find ${DotFiles} -type f -name "index\.html" -exec rm -f {} +;
fi

if [[ ${kill_empty_dir} == 1 ]]; then
#    rm -d ${DotFiles}/
    find ${DotFiles} -xdev -type d | xargs -I{} find {} -maxdepth 0 -empty | xargs rm -d
    find ${DotFiles} -xdev -type d | xargs -I{} find {} -maxdepth 0 -empty | xargs rm -d
fi



## now public-ify the .gitconfig
sed 's/\(^\t* *name *= *\).*/\1<some-name>/g' ~/.gitconfig | sed 's/\(^\t* *email *= *\).*/\1<some@email>/g' > ${DotFiles}/pub/.gitconfig
