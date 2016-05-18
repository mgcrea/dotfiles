#!/bin/bash
DATE=$(date +%I:%M%p)
CHECK='\033[32m✔\033[39m'
HR='##################################################'

echo -e "\n${HR}"
echo -e "Setting up dotfiles..."
echo -e "${HR}\n"

p="$HOME/.dotfiles";
for f in $(find $p -maxdepth 1 -mindepth 1 -type f -print0 | xargs -0); do
	f=`basename "$f"`
	echo -n "Linking \"$f\"..."
	ln -fs ".dotfiles/$f" "$HOME/$f"
	echo -e "		${CHECK} Done"
done

if [[ $OSTYPE =~ "darwin" ]]; then
	echo -n "Prossessing \".profile\"..."
	ln -fs ".dotfiles/osx/.profile" "$HOME/.profile"
	echo -e "		${CHECK} Done"
fi

# if [[ $OSTYPE =~ "linux" ]]; then
# 	echo -n "Installing \"rmate\"..."
# 	curl https://raw.github.com/aurora/rmate/master/rmate > rmate
# 	sudo mv rmate /usr/local/bin
# 	sudo chmod +x /usr/local/bin/rmate
# 	echo -e "		${CHECK} Done"
# fi

echo -n "Installing \"Vundle\"..."
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo -e "			${CHECK} Done"

echo -e "\n${HR}"
echo -e "Dotfiles successfully setup at ${DATE}."
echo -e "${HR}\n"

# echo "Apply osx config"
# bash "$p/osx/.osx"
# echo "."
#
# ioreg -lw0 | grep \"EDID\" | sed "/[^<]*</s///" | xxd -p -r | strings -6

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
