#!/bin/bash

touch v_problem
> v_problem 

num=1
mode="+"

tail -n 0 -f v_problem |
while true
do
    read line
    case $line in
        "+")
            mode="+"
            echo "Switched to the adding mode"
            ;;
        "*")
            mode="*"
            echo "Switched to the multiplying mode"
            ;;
        "QUIT")
            echo "Stopped by the QUIT input"
       		killall tail

            exit 0
            ;;
        [0-9]*)
            case $mode in
                "+")
                    echo "Adding" $num "and " $line						
                    num=$(($num + $line))
                    echo "And getting " $num
                    ;;
                "*")
                    echo "Multiplying" $num "and " $line						
                    num=$(($num * $line))
                    echo "And getting " $num
                    ;;
            esac
            ;;
        *) 
			echo "Stopped by the INCORRECT input !!"
			killall tail
            exit 1
            ;;
    esac
done