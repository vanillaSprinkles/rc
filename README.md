my rc files - at least the ones i want people to see

HOME: all my HOME rc's for an X environment setup (and then some)


## installation



##### clone repo
- `sudo  mkdir  /home/bashDotFiles/`
- `sudo  chown  $(id -u):$(id -g)  /home/bashDotFiles/`
- pick one:
  `git  clone https://github.com/vanillaSprinkles/rc  /home/bashDotFiles/`
  `git  clone ssh://git@github.com/vanillaSprinkles/rc  /home/bashDotFiles/`

- git sub module sync
  ``` bash
  cd  /home/bashDotFiles/
  
  ```


##### for new users (append to /etc/skel/.bashrc and auto create symlink when user logs-in)
``` bash
cat << 'EOF'  >> /etc/skel/.bashrc


if [[ -f /home/bashDotFiles/HOME/.bashrc ]]; then

  # create symlink: .bash_stuff
  if [ ! -e ~/.bash_stuff ]; then
     ln -s  /home/bashDotFiles/HOME/.bash_stuff  ~/.bash_stuff
  fi

  # create symlink: .bscripts
  if [ ! -e ~/.bscripts ]; then
     ln -s  /home/bashDotFiles/HOME/.bscripts  ~/.bscripts
  fi

  # set PATH so it includes user's private bin if it exists
  [[ -d ~/bin ]] && PATH=~/bin:"${PATH}"
  [[ -d ~/.bscripts ]] && PATH=~/.bscripts:"${PATH}"
  export PATH

 . /home/bashDotFiles/HOME/.bashrc
fi

EOF
```


##### symlink (current user cutover; create symlinks ect)
``` bash
cat << 'EOF'  >> ~/.bashrc


if [[ -f /home/bashDotFiles/HOME/.bashrc ]]; then

  # create symlink: .bash_stuff
  if [ ! -e ~/.bash_stuff ]; then
     ln -s  /home/bashDotFiles/HOME/.bash_stuff  ~/.bash_stuff
  fi

  # create symlink: .bscripts
  if [ ! -e ~/.bscripts ]; then
     ln -s  /home/bashDotFiles/HOME/.bscripts  ~/.bscripts
  fi

  # set PATH so it includes user's private bin if it exists
  [[ -d ~/bin ]] && PATH=~/bin:"${PATH}"
  [[ -d ~/.bscripts ]] && PATH=~/.bscripts:"${PATH}"
  export PATH

 . /home/bashDotFiles/HOME/.bashrc
fi

EOF
```

``` bash
. ~/.bashrc
```









----

## git submodules
use `make` to sparse-checkout + update select submodules (currently only pulling grawity/code)


----


RC files backed up with by calling handy-dandy script: "HOME/.bscripts/HomeDotSync"
	checkout the 'confFile' lines within this script to see the working config location and file

2013-01-21:
	re-created the repo; removed the work/headless config as it will exist as another repo (rc_headless)

