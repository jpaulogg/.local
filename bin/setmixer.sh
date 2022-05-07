#!/bin/sh

# Muda o volume e envia notificação
# Changes volume and send notification

amixer -c 0 set Master,0 "$@" 2> /dev/null

VOLUME="$(amixer -c 0 get Master | tail -1 | cut -d '[' -f 2)"

notify-send "Volume: " -h int:value:"${VOLUME%\%]}"
