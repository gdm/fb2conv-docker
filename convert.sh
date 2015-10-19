#!/bin/bash
file="$1"

if [[ ! -f "/data/$file" ]]; then
    echo "Could not found file /data/$file"
    exit 1
fi

python /app/fb2conv.py "/data/$file"