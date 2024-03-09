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



##### symlink
- for .bash_profile and .bashrc
  ``` bash
  mv -i  ~/.bash_profile  ~/.bash_profile.BAK_pre_vs_$( date --iso-8601=seconds )
  ln -s  /home/bashDotFiles/HOME/.bash_profile  ~/.bash_profile
  ```


  ``` bash
  mv -i  ~/.bashrc  ~/.bashrc.BAK_pre_vs_$( date --iso-8601=seconds )
  ln -s  /home/bashDotFiles/HOME/.bashrc  ~/.bashrc
  ```


- for alias' and bin/scripts
  ``` bash
  ln -s  /home/bashDotFiles/HOME/.bash_stuff  ~/.bash_stuff
  ln -s  /home/bashDotFiles/HOME/.bscripts  ~/.bscripts
  ```



----

## git submodules
use `make` to sparse-checkout + update select submodules (currently only pulling grawity/code)


----


RC files backed up with by calling handy-dandy script: "HOME/.bscripts/HomeDotSync"
	checkout the 'confFile' lines within this script to see the working config location and file

2013-01-21:
	re-created the repo; removed the work/headless config as it will exist as another repo (rc_headless)

