#!/bin/sh

# Assignment 1 File writer solution
# Author : Amiya Das

if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# create file path if it does not exist
mkdir -p "$(dirname "$writefile")"

# write the string to file overwriting existing content
if ! echo "$writestr" > "$writefile"; then
    echo "Error: Could not write to $writefile"
    exit 1
fi

exit 0
