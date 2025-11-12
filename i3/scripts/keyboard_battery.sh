#!/usr/bin/env bash

KBD_PATH="/org/freedesktop/UPower/devices/keyboard_dev_D7_E8_29_FA_0F_D0"

if upower -i "$KBD_PATH" 2>/dev/null | grep -q "present:.*yes"; then
    perc=$(upower -i "$KBD_PATH" | awk '/percentage:/ {print $2}')

    echo "KBD:$perc"
    echo "KBD:$perc"

    raw=${perc%\%}

    if [ "$raw" -ge 15 ]; then
        echo "#ffffff"
    else
        echo "#ffcc66"
    fi

else
    echo ""
fi

