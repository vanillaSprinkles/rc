#!/usr/bin/env bash



function reminder-audio-streaming () {

cat <<EOF

paprefs (requires) gschema:
su -
cd /usr/share/glib-2.0/schemas/
wget https://cgit.freedesktop.org/pulseaudio/pulseaudio/plain/src/modules/gsettings/org.freedesktop.pulseaudio.gschema.xml
glib-compile-schemas /usr/share/glib-2.0/schemas/


EOF

}