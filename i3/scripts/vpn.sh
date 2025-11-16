#!/usr/bin/env bash

STATUS="$(mullvad status 2>/dev/null)"

if echo "$STATUS" | grep -q "^Connected"; then
    echo "UP"
    echo "UP"
    echo "#00b894"
else
    echo "DOWN"
    echo "DOWN"
    echo "#ff0000"
fi

