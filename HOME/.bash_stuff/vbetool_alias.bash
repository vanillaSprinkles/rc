#!/usr/bin/bash

alias MonitorOff='vbetool dpms off'

alias MonitorOn='vbetool dpms on'


## https://bbs.archlinux.org/viewtopic.php?id=66169
## sudoers: username   ALL=NOPASSWD:/usr/sbin/vbetool  dpms on,/usr/sbin/vbetool  dpms off
## assign a key to turn off ,another to turn on in openbox rc.xml

