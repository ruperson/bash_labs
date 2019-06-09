#!/bin/bash

rm -rf ~/restore 2> /dev/null
mkdir ~/restore

backup_dir=$(find ~/Backup-* -maxdepth 0 | sort -n | tail -n 1)
for file in $(ls $backup_dir );
do
	if [ -z "$(echo $file | grep -E "*.[0-9]{4}-[0-9]{2}-[0-9]{2}")" ];
	then
		cp $backup_dir"/"$file ~/restore/$file
	fi
done