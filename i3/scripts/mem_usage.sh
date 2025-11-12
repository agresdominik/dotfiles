#!/bin/sh

used=$(free -h --si | awk '/^Mem/ {print $3}')
total=$(free -h --si | awk '/^Mem/ {print $2}')

text="${used}/${total}"

echo "$text"
echo "$text"

u=$(free --si | awk '/^Mem/ {print $3}')
t=$(free --si | awk '/^Mem/ {print $2}')

u_num=${u%[A-Za-z]*}
t_num=${t%[A-Za-z]*}

pct=$(awk -v u="$u_num" -v t="$t_num" 'BEGIN {printf "%.0f", (u/t)*100}')

if [ "$pct" -ge 90 ]; then
    echo "#ffcc66"
else
    echo "#ffffff"
fi
