#!/usr/bin/env bash

#### for headless systems, minimalistic setups, ect
##     https://specifications.freedesktop.org/basedir-spec/latest/
##     https://wiki.archlinux.org/title/XDG_Base_Directory


### user dirs
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-"${HOME}"/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-"${HOME}"/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-"${HOME}"/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-"${HOME}"/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-/run/user/${UID}}

### system dirs
export XDG_DATA_DIRS=${XDG_DATA_DIRS:-"/usr/local/share:/usr/share"}
export XDG_CONFIG_DIRS=${XDG_CONFIG_DIRS:-"/etc/xdg"}
