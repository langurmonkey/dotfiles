#!/bin/sh

if [ $# -lt 1 ]; then
    echo "USAGE: $0 <path>"
    exit 1
fi

if [ -d $1 ]; then
    find $1 -type d -print0 | xargs -0 chmod 0755
    find $1 -type f -print0 | xargs -0 chmod 0644 
fi
