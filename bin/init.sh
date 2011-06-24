#!/bin/bash

pwd=`pwd`;
pwd=~/.dotfiles;

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

cat $pwd/.ssh/authorized_keys >> ~/.ssh/authorized_keys

    
