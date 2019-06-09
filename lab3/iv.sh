#!/bin/bash
ps -A -o pid | tail -n +2 | awk '{ file="/proc/"$1"/statm"; getline f<file; close (file); split(f, a); print $1, ":", a[2]-a[3] }' | sort -r -n -t ":" -k2 

