#!/bin/bash

function setConsoleImage () {

    WALLPAPER="$1"
    XSCREENRES="$2"
    YSCREENRES="$3"

    ffmpeg -loop_input -vframes 5 -i "${WALLPAPER}" -r 1 -b 1800 -y -s ${XSCREENRES}x${YSCREENRES} /tmp/wall.avi >/dev/null 2>&1
    sudo mplayer -vo cvidix -screenw ${XSCREENRES} -screenh ${YSCREENRES} -colorkey 000000 -really-quiet /tmp/wall.avi -fixed-vo -loop 0 >/dev/null 2>&1

    }
