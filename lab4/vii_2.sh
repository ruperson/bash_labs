#!/bin/bash

echo $$ > vii_problem
cur=1
mode="+"
sigterm()
{
    echo "Stopped by SIGTERM signal"
    exit 0
}
user1()
{
    mode="+"
}
user2()
{
    mode="*"
}
trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2
while true;
do
    case "$mode" in
        +)
            cur=$(($cur + 2))
            ;;
        [*])
            cur=$(($cur * 2))
            ;;
    esac
    sleep 1
    echo "$cur"
done

