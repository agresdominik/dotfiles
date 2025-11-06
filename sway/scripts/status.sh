#!/bin/bash
mem=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.1f%%", usage}')
bat=$(cat /sys/class/power_supply/macsmc-battery/capacity 2>/dev/null || echo "N/A")
time=$(date "+%d.%m %H:%M:%S")

echo "$USER | CPU: $cpu | MEM: $mem | BAT: $bat% | $time"

