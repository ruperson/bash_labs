#!/bin/bash

echo $$ > vi_problem

cnt=0
running=1

handle() 
{ 
running=0
}

trap 'handle' SIGTERM

while (( running != 0 )) ; 
do
        ((cnt=$cnt + 1))
        sleep 1
        echo $cnt
done

echo "Stopped by SIGTERM signal"