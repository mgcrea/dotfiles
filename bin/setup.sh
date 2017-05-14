#!/bin/bash
DATE=$(date +%I:%M%p)
HR='##################################################'
DIRNAME="$(cd "$(dirname "$0")" && pwd -P)"

echo -e "\n${HR}"
echo -e "Setting up dotfiles..."
echo -e "${HR}\n"

baseDirectory="$(realpath $DIRNAME/..)";
for f in $(find $baseDirectory -maxdepth 1 -mindepth 1 -type f ! -name '.DS_Store' -print0 | xargs -0); do
	f="$(basename "$f")"
	echo -n "Linking \"$f\"..."
	ln -fs ".dotfiles/$f" "$HOME/$f"
	printf ' \e[1;32m%s\e[m\n' ✔
done

if [[ $OSTYPE =~ "darwin" ]]; then
	echo -n "Prossessing \".profile\"..."
	ln -fs "${baseDirectory}/osx/.profile" "$HOME/.profile"
	sudo cp ${baseDirectory}/osx/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
	sudo cp ${baseDirectory}/osx/limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist
	printf ' \e[1;32m%s\e[m\n' ✔
fi

echo -n "Installing \"Vundle\"..."
if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
printf ' \e[1;32m%s\e[m\n' ✔

echo -n "Installing \"Tpm\"..."
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
printf ' \e[1;32m%s\e[m\n' ✔

if [[ $OSTYPE =~ "linux" ]]; then
	echo -n "Installing \"Git completion\"..."
	curl -L https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh > ~/.git-prompt
	printf ' \e[1;32m%s\e[m\n' ✔
fi

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
