#!/bin/bash

########################################################
#
# Clone current class qcow to student qcow
# Author : Jash Lee
# May 31, 2015
# startIndex && endIndex both represent Student number
# src && dest must have backslash
########################################################

if [ "$#" -ne 4 ]; then
    echo "Usage: $0 src dest startIndex endIndex"
    echo "Example: $0 /home/vmdsk/CS6373-clean/ /home/vmdsk/ 10 500"
    exit 1
fi

SRC="$1"
DEST="$2"
let START="$3"
let END="$4"

for files in ${SRC}*; do
      filename="$(basename "$files")"
      for ((i=START; i <= END; i++));do
        echo "cloning ${files} to ${DEST}${filename}${i}.qcow"
        cp "$files" "$DEST$filename$i".qcow
      done
done
