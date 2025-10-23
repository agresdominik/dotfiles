#!/usr/bin/env bash
set -euo pipefail

# Which output contains the focused node?
output=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true) | .output')

# Get its geometry from i3 directly
geometry=$(i3-msg -t get_outputs \
  | jq -r --arg out "$output" '.[] | select(.name==$out and .active) 
      | .rect | "\(.width)x\(.height)+\(.x)+\(.y)"')

# Shoot that output
exec maim -u -g "$geometry" "$@"

