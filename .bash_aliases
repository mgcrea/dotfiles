
# Directory
function md { mkdir --parents "$1"; cd "$1"; }
function cdw { cd "/srv/www/$1"; }
alias ls="ls -hF --color=auto"
alias dir="ls --color=auto --format=vertical"
alias vdir="ls --color=auto --format=long"
alias ll="ls --color=auto -lh"
alias la="ls --color=auto -la"
alias l="ls --color=auto -CF"

# Miscellaneous
alias c="clear"
alias h="cd ~"
alias ..="cd .."
alias cd..="cd .."
#alias -="cd -"
alias cd-="cd -"
alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias grep="grep --color"

alias tf="tail -fn200 $*"
alias static-dev="static -H '{\"Cache-Control\": \"no-cache, must-revalidate\"}' $*"

# Rights
alias chmod644="sudo chmod -R 644 ./ && sudo find ./ -type d -exec chmod 0755 {} \;"
alias chmod660="sudo chmod -R 660 ./ && sudo find ./ -type d -exec chmod 0770 {} \;"
alias chownwww="sudo chown -R www-data:www-data ./"

# OSX
if [[ $OSTYPE =~ "darwin" ]]; then
	# Applications
	alias st="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
# *NIX
else
	# Aptitude
	alias aptu="sudo apt-get update && sudo apt-get upgrade -y"
	alias apti="sudo apt-get install"
fi;

# Git
alias gps="git push"
alias gpl="git pull"
alias gs="git status"
alias gco="git checkout"
alias gc="git commit -am"
