
RC_FILE=".bashrc"
[[ $OSTYPE =~ "darwin" ]] && { RC_FILE=".zshrc"; }

declare -a arr=(
  ".bash_aliases"
  ".gitconfig"
  ".screenrc"
  ".tmux.conf"
  $RC_FILE
)

for file in "${arr[@]}"; do
	echo -n "Linking \"$file\"..."
  echo ln -fs ".dotfiles/$f" "${HOME}${f}"
	printf ' \e[1;32m%s\e[m\n' ✔
done
