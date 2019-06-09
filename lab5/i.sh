#!/bin/bash
#Replace . with ~

cnt=0
while [[ -e "./.trash/$1_$cnt" ]] ; do
    ((cnt=cnt + 1))
done

ln $1 ./.trash/$1_$cnt
rm $1 && 
echo "$(realpath $1) $1_$cnt" >> ./.trash.log