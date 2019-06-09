#!/bin/bash

while true 
do 
	read line
	echo "$line" >> v_problem
	
	if [[ "$line" == "QUIT" ]]
	then 
		exit 0
	fi

	if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]] 
	then 
		echo "Incorrect input :("
		exit 1
	fi
done