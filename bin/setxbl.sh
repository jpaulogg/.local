#!/bin/sh

# Altera o brilho do sistema e notifica o valor atual
# Changes brightness and send notification

xbacklight "$@" 2> /dev/null
BRIGHTNESS="$(printf '%.*f' 2 `xbacklight -get`)"
notify-send "Luminosidade: " -h int:value:"$BRIGHTNESS"

