#!/bin/bash

pwd=`pwd`;
rep=~/.dotfiles;

shopt -s dotglob

for file in `ls -a $rep`
do
	if [ -f $file ]; then
		echo "Processing $file..."
		if [ -f  ~/$file ]; then
			mv ~/$file ~/$file.bak
		fi;
		ln -s $pwd/$file ~/$file
	fi;
done;
