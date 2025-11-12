#!/bin/sh
HOST=192.168.0.200

if ping -c1 -W1 "$HOST" >/dev/null 2>&1; then
    echo "UP"
    echo "UP"
    echo "#00b894"
else
    echo "DOWN"
    echo "DOWN"
    echo "#ff0000"
fi

