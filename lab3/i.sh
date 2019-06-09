#!/bin/bash
ps a -u ruperson --format pid,command | awk '{print $1":"$2}' 
