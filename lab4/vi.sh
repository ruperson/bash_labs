#!/bin/bash

while true
do
	read line
	case $line in
		TERM)
			kill -SIGTERM $(cat vi_problem)
			exit 0
			;;
		*)
			continue
			;;
	esac
done