# sponsorblock-mpv-local
addon for local sponsor video blocking

based on https://codeberg.org/jouni/mpv_sponsorblock_minimal

```
curl -L "https://sponsor.ajay.app/database/sponsorTimes.csv" -o "$HOME/.local/share/sponsorTimes.csv"
git clone 'https://github.com/asakura42/sponsorblock-mpv-local.git' ~/.config/mpv/scripts/sponsorblock
```

default bind is `b` to turn plugin on and off

If you want use this script with pipe-viewer (https://github.com/trizen/pipe-viewer), edit your pipe-viewer config by modifying the mpv section:

```
 mpv => {
          arg => "--really-quiet *URL*",
          audio => "",
          cmd => "mpv",
          fs => "--fullscreen",
          novideo => "--no-video",
          srt => "--sub-file=*SUB*",
        },
```

straw-viewer support is in another branch, unstable and in progress, you can send me PR or issue if you know how to make it work.
