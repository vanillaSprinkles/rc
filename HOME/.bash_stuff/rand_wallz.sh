#!/bin/sh

# https://wiki.archlinux.org/index.php/Feh



rotate='15m'
wallz='~/.config/wallz'

if test -d $wallz; then
    while true; do
	find ${wallz} -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
	    shuf -n1 -z | xargs -0 feh --bg-scale
	    sleep ${rotate}
    done
fi




