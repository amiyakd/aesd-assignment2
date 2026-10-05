#!/bin/sh
# Assignent 1 : Find the no of matching lines in files
# Author : Amiya Das

if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# check if filesdir is valid directory or not
if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir does not represent a directory on the filesystem"
    exit 1
fi

# calculate no of files in the directory
numfiles=$(find "$filesdir" -type f | wc -l)

# calculate no of matching lines containing search string
matchinglines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are "$numfiles" and the number of matching lines are "$matchinglines""

exit 0

