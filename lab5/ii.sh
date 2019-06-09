#!/bin/bash
#Replace . with ~

line=""
while read line; do	
	if  ! grep -q $1 <<< $line; then
		continue
	fi

    to_untrash=$(echo $line | cut -d " " -f 1)
    to_delete=$(echo $line | cut -d " " -f 2)
    echo "Was deleted with a code name: " $to_delete

    echo "Are you sure to restore $to_untrash ? (y/n)"
    read answer < /dev/tty
    if [[ "$answer" == "y" ]]; then
        where="$to_untrash"
        if [[ ! -d "$(dirname "$to_untrash")" ]]; then
        	echo "No original directory. Restoring at home"
        	where = "~/$1"
        fi 
    	ln "./.trash/$to_delete" $where &&
        rm ./.trash/$to_delete && 
        {
      	sed -i "/$to_delete/d" ./.trash.log
        echo "Restored $to_untrash"
        }
    fi
done < ./.trash.log