#!/bin/bash

while true;
do
read line
case "$line" in
    TERM)
        kill -SIGTERM $(cat vii_problem)
        exit
        ;;
    +)
        kill -USR1 $(cat vii_problem)
        ;;
    [*])
        kill -USR2 $(cat vii_problem)
        ;;
	*)
	    continue
	;;		
esac
done
