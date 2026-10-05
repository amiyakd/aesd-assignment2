#!/bin/sh

# the first argument is a full path to a file (including filename) on the filesystem, referred to below as writefile; # the second argument is a text string which will be written within this file, referred to below as writestr
# Author : Amiya Das

if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

writefile="$1"
writestr="$2"

mkdir -p "$(dirname "$writefile")"
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not write to $writefile"
    exit 1
fi

exit 0
