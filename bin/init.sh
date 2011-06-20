#!/bin/bash

pwd=`pwd`;

shopt -s dotglob

for file in *
do
	if [ -f $file ]; then 
		echo "Processing $file..."
		if [ -f  ~/$file ]; then 
			mv ~/$file ~/$file.bak
		fi;
		ln -s $pwd/$file ~/$file
	fi;
done;
    
