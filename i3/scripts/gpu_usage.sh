#!/bin/bash
# ~/.config/i3/scripts/gpu_usage.sh

if command -v rocm-smi &>/dev/null; then
    output=$(rocm-smi --showtemp --showuse)
    temp=$(echo "$output" | awk -F': ' '/Sensor edge/ {print $3; exit}')
    usage=$(echo "$output" | awk -F': ' '/GPU use/ {print $3; exit}')

    echo "${usage}% ${temp}°C"          
    echo "${usage}% ${temp}°C"          

    if [ "$usage" -ge 90 ]; then
        echo "#ffcc66"
    else
        echo "#ffffff"
    fi
else
    echo "N/A"
    echo "N/A"
    echo "#ffffff"
fi

