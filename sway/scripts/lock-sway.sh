#!/usr/bin/env bash
set -euo pipefail

IMG_PATH="${XDG_RUNTIME_DIR:-/tmp}/lock.png"

exec swayidle -w \
  timeout 30  "grim -t png \"$IMG_PATH\" && magick \"$IMG_PATH\" -blur 0x12 \"$IMG_PATH\" && swaylock -f -i \"$IMG_PATH\"" \
  timeout 600 'swaymsg "output * power off"' \
  resume      'swaymsg "output * power on"' \
  before-sleep "grim -t png \"$IMG_PATH\" && magick \"$IMG_PATH\" -blur 0x12 \"$IMG_PATH\" && swaylock -f -i \"$IMG_PATH\""
