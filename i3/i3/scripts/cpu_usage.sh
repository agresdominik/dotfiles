#!/bin/sh

usage=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')

temp=$(sensors | awk '/^Tctl:/ {gsub(/[+°]C/, "", $2); print $2; exit}')
temp=${temp#+}

text="${usage}% ${temp}°C"

echo "$text"
echo "$text"

if [ "$(printf "%.0f" "$usage")" -ge 90 ]; then
    echo "#ffcc66"
else
    echo "#ffffff"
fi
