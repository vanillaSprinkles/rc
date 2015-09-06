#!/bin/bash
if [ $USER == "root" ]; then
    alias journalctl-failed-ssh="journalctl -u sshd | sed -nr  's/.*Failed .* (.+?) from ([0-9.]+).*/\1 \2/p' | sort -u"





    

fi

