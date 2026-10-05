#!/bin/sh
# the first argument is a path to a directory on the filesystem, 
# referred to below as filesdir; the second argument is a text string which will be searched within these files, 
# referred to below as searchstr
# Author : Amiya Das

if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]; then
    echo "Error: $filesdir does not represent a directory on the filesystem"
    exit 1
fi


numfiles=$(find "$filesdir" -type f | wc -l)

matchinglines=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are "$numfiles" and the number of matching lines are "$matchinglines""

exit 0

