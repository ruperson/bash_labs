#!/bin/bash

file /bin/* | grep ' script' | cut -d : -f 1 | xargs -n 1 head -n 1 | sort | uniq -c | sort -n -r | head -n 1 | awk '{print $2}'
