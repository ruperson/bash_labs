#!/bin/bash

outfile="v.out"

#status=""

for pid in $(ps -axo pid)
do
	file1="/proc/"$pid"/status"
	file2="/proc/"$pid"/sched"
	
	ppid=$(grep -E -s -h "PPid" $file1 | grep -E -s -o "[0-9]+")
	sleepavg=$(grep -E -s -h "avg_atom" $file2 | grep -E -s -o "[0-9.]+")

	if [[ -z $sleepavg ]]
	then 
		sleepavg=0
	fi

	if [[ -n $ppid ]]

	then 
		echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Sleeping_Time=$sleepavg"
	fi
done | sort -n -t "=" -k3 > $outfile