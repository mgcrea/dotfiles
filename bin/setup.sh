#!/bin/bash

if [[ $OSTYPE =~ "darwin" ]]; then
	home="/Users/`whoami`"
else
	home="/home/`whoami`"
fi;

p="$home/.dotfiles";
for f in $(find $p -maxdepth 1 -mindepth 1 -type f -print0 | xargs -0); do
	f=`basename "$f"`
	echo "Prossessing $f"
	ln -fs ".dotfiles/$f" "$home/$f"
	echo "."
done;

if [[ $OSTYPE =~ "darwin" ]]; then
	echo "Prossessing .profile"
	ln -fs ".dotfiles/osx/.profile" "/Users/olivier/.profile"
	echo "."
	# echo "Apply osx config"
	# bash "$p/osx/.osx"
	# echo "."
	#
	# ioreg -lw0 | grep \"EDID\" | sed "/[^<]*</s///" | xxd -p -r | strings -6
else
	# Setup rmate
	curl https://raw.github.com/aurora/rmate/master/rmate > rmate
	sudo mv rmate /usr/local/bin
	sudo chmod +x /usr/local/bin/rmate
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
