#!/bin/bash

if pgrep -x i3lock >/dev/null; then
    exit 0
fi

img=/tmp/lock.png

scrot --overwrite "$img"

magick "$img" -blur 0x8 "$img"

i3lock \
  -i "$img" \
  --inside-color=373445ff \
  --ring-color=ffffffff \
  --line-color=00000000 \
  --keyhl-color=d23c3dff \
  --bshl-color=d23c3dff \
  --separator-color=00000000 \
  --insidever-color=ffffff1c \
  --insidewrong-color=d23c3d1c \
  --ringver-color=ffffffff \
  --ringwrong-color=d23c3dff \
  --indicator \
  --clock \
  --time-color=ffffffff \
  --date-color=ffffffff \
  --time-font="JetBrainsMono Nerd Font" \
  --date-font="JetBrainsMono Nerd Font" \
  --radius=120
