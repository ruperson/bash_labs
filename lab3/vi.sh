#!/bin/bash

infile="v.out"
outfile="vi.out"

previous_ppid=-1
sum=0
cnt=0

while read line ; do
    echo $line

    ppid=$(echo $line | cut -d ":" -f 2 | grep -E -s -o "[0-9]+")
    sleepavg=$(echo $line | cut -d ":" -f 3 | grep -E -s -o "[0-9]+")

    if (( previous_ppid != -1 && ppid != previous_ppid )) ; then
        echo Average_Sleeping_Children_of_ParentID=$previous_ppid is $(echo "scale=2; $sum / $cnt" | bc -l)
        sum=0
        cnt=0
    fi

    sum=$(echo "scale=2; $sum + $sleepavg" | bc -l)
    previous_ppid=$ppid
    ((cnt++))
done < $infile > $outfile

echo Average_Sleeping_Children_of_ParentID=$previous_ppid is $(echo "scale=2; $sum / $cnt" | bc -l) >> $outfile