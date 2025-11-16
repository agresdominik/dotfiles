#!/bin/bash
mem=$(free -h --si | awk '/Mem:/ {print $3 "/" $2}')
cpu=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF"%"}')
bat=$(cat /sys/class/power_supply/macsmc-battery/capacity 2>/dev/null || echo "N/A")
time=$(date "+%d.%m %H:%M:%S")
bright=$(echo "$(brightnessctl get) / 4.2" | bc)
VPN_STATUS=$(mullvad status 2>/dev/null | grep -q '^Connected' && echo UP || echo DOWN)
LAB_STATUS=$(ping -c1 -W1 192.168.0.200 >/dev/null 2>&1 && echo UP || echo DOWN )

echo "$USER | LAB: $LAB_STATUS | VPN: $VPN_STATUS | CPU: $cpu | MEM: $mem | BAT: $bat% | BRI: $bright% | $time "

