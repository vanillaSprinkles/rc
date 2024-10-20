#!/usr/bin/env bash

### https://news.ycombinator.com/item?id=12256663

## mkfifo /tmp/fast.com.test.fifo ;token=$(curl -s https://fast.com/app-ed402d.js|grep -E -om1 'token:"[^"]+'|cut -f2 -d'"'); curl -s "https://api.fast.com/netflix/speedtest?https=true&token=$token" |grep -E -o 'https[^"]+'|while read url; do first=${url/speedtest/speedtest\/range\/0-2048}; next=${url/speedtest/speedtest\/range\/0-26214400};(curl -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com' "$first" > /tmp/fast.com.test.fifo; for i in {1..10}; do curl -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com'  "$next">>/tmp/fast.com.test.fifo; done)& done & pv /tmp/fast.com.test.fifo > /dev/null; rm /tmp/fast.com.test.fifo





if [[ "${@,,}" =~ (^| )-*h(elp)?($| ) ]]; then
    cat <<EOF
credits: https://news.ycombinator.com/item?id=12256663
all other argv's are passed directly to curl
EOF
    exit
fi


_FIFO=/tmp/fast.com.test.fifo-$(whoami)
mkfifo "${_FIFO}"

token=$(curl "$@" -s https://fast.com/app-ed402d.js|grep -E -om1 'token:"[^"]+'|cut -f2 -d'"')  ## sed -r 's/.*token:"([^"]+)".*/\1/g;q'

curl "$@" -s "https://api.fast.com/netflix/speedtest?https=true&token=$token" |grep -E -o 'https[^"]+'| \
     while read url; do
           first=${url/speedtest/speedtest\/range\/0-2048}
           next=${url/speedtest/speedtest\/range\/0-26214400}
           (
                curl "$@" -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com' "$first" > "${_FIFO}"
                for i in {1..10}; do
                    curl "$@" -s -H 'Referer: https://fast.com/' -H 'Origin: https://fast.com'  "$next" >> "${_FIFO}"
                done
            )&
     done & pv "${_FIFO}" > /dev/null

rm "${_FIFO}"
