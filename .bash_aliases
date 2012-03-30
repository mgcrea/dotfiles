# Directory listings
alias ls="ls -hF --color=tty"
alias dir="ls --color=auto --format=vertical"
alias vdir="ls --color=auto --format=long"
alias ll="ls -l"
alias la="ls -la"
alias l="ls -CF"

# Miscellaneous
alias c="clear";
alias h="cd ~";
alias cd..="cd .."
alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias grep="grep --color"
alias tf="tail -fn200"

# Chmod
alias chmod644="sudo chmod -R 644 ./ && sudo find ./ -type d -exec chmod 0755 {} \;"
alias chmod660="sudo chmod -R 660 ./ && sudo find ./ -type d -exec chmod 0770 {} \;"

if [ -d /Users ];
then
	# OSX
	echo;
else
	# *NIX
	
	# Aptitude
	alias agu="sudo apt-get update && sudo apt-get upgrade"
	alias agi="sudo apt-get install"
fi;

# Developer
function cdsites
{
	cd /srv/www/$1
}

# Git
alias gps="git push"
alias gpl="git pull"
alias gs="git status"
alias gco="git checkout"
alias gc="git commit -m"
alias gca="git commit -am"
