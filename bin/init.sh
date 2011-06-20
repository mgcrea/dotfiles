#!/bin/bash

pwd=`pwd`;

shopt -s dotglob

for file in *
do
	if [ -f $file ]; then 
		echo "Processing $file..."
		if [ -f  $pwd/$file ]; then 
			mv $pwd/$file $pwd/$file.bak
		fi;
		ln -s ~/$file $pwd/$file
	fi;
done;
    
