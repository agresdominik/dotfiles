#!/usr/bin/env bash

MOUSE_PATH=$(upower -e | grep -E 'hidpp_battery_[0-9]+$' | head -n 1)

if [[ -n "$MOUSE_PATH" ]] && upower -i "$MOUSE_PATH" 2>/dev/null | grep -q "present:.*yes"; then
    perc=$(upower -i "$MOUSE_PATH" | awk '/percentage:/ {print $2}')

    echo "MOUSE:$perc"
    echo "MOUSE:$perc"

    raw=${perc%\%}

    if [ "$raw" -ge 15 ]; then
        echo "#ffffff"
    else
        echo "#ffcc66"
    fi
else
    echo ""
fi

