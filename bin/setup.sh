#!/bin/bash

p="/Users/olivier/.dotfiles";
for f in $(find $p -maxdepth 1 -mindepth 1 -type f -print0 | xargs -0); do
	f=`basename "$f"`
	echo "Prossessing $f"
	ln -Fs ".dotfiles/$f" "/Users/olivier/$f"
	echo "."
done;

if [[ $OSTYPE =~ "darwin" ]]; then
	echo "Prossessing .profile"
	ln -Fs ".dotfiles/.profile" "/Users/olivier/.profile"
	echo "."
	# echo "Apply osx config"
	# bash "$p/osx/.osx"
	# echo "."
	#
	# ioreg -lw0 | grep \"EDID\" | sed "/[^<]*</s///" | xxd -p -r | strings -6
fi;

# pwd=`pwd`;
# rep=~/.dotfiles;

# shopt -s dotglob

# for file in `ls -a $rep`
# do
# 	if [ -f $file ]; then
# 		echo "Processing $file..."
# 		if [ -f  ~/$file ]; then
# 			mv ~/$file ~/$file.bak
# 		fi;
# 		ln -s $pwd/$file ~/$file
# 	fi;
# done;