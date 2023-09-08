#!/usr/bin/env bash

RES=$(amixer -q -c 0 set Beep mute 2>&1)
if [[ $DEBUG -ne 0 && $? -ne 0 ]]; then
    echo -e "$RES"
fi
