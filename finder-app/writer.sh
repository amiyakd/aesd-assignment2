#!/bin/sh

# Assignment 1 File writer solution
# Author : Amiya Das

if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required." >&2
    echo "Usage: $0 <writefile> <writestr>" >&2
    exit 1
fi

writefile="$1"
writestr="$2"

# create file path if it does not exist
if ! mkdir -p "$(dirname "$writefile")"; then
    echo "Error: Could not create directory for $writefile" >&2
    exit 1
fi

# write the string to file overwriting existing content
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not write to $writefile" >&2
    exit 1
fi

exit 0
