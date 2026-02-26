#!/bin/bash
MEM=$(free -h --si | awk '/Mem:/ {print $3 "/" $2}')

CPU=$(mpstat 1 1 | awk '/Average/ {printf "%.1f%%\n", 100 - $NF"%"}')

CAP=$(cat /sys/class/power_supply/macsmc-battery/capacity 2>/dev/null || echo "N/A")
STAT=$(cat /sys/class/power_supply/macsmc-battery/status 2>/dev/null || stat="")
if [[ $CAP != "N/A" && $STAT == "Charging" ]]; then
  BAT="${CAP}% (C)"
elif [[ $CAP != "N/A" ]]; then
  BAT="${CAP}%"
else
  BAT="N/A"
fi

TIME=$(date "+%d.%m %H:%M")

#BRIGHT=$(echo "$(brightnessctl get) / 4.2" | bc)

VPN_STATUS=$(mullvad status 2>/dev/null | grep -q '^Connected' && echo UP || echo DOWN)
LAB_STATUS=$(ping -c1 -W1 192.168.0.200 >/dev/null 2>&1 && echo UP || echo DOWN )

UPTIME=$(awk '{t=int($1); d=t/86400; h=(t%86400)/3600; m=(t%3600)/60; if(d>0) printf "%dd %02d:%02dh\n", d,h,m; else printf "%02d:%02dh\n", h,m}' /proc/uptime)

POWER=$(powerprofilesctl get | tr '[:lower:]' '[:upper:]')

echo "$USER | UPT: $UPTIME | POW: $POWER | LAB: $LAB_STATUS | VPN: $VPN_STATUS | CPU: $CPU | MEM: $MEM | BAT: $BAT | $TIME "
