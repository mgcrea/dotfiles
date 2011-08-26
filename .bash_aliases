# Directory listings
alias ls='ls -hF --color=tty'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'
alias la='ls -la'
alias l='ls -CF'

# Miscellaneous
alias c='clear'
alias h='cd ~'
alias up='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias up5='cd ../../../../..'
alias grep='grep --color'

if [ -d /Users ];
then
	# OSX

else
	# *NIX
	
	# Aptitude
	alias agu='sudo apt-get update && sudo apt-get upgrade'
	alias agi='sudo apt-get install'
fi;

# Developer
alias cdcol='cd /srv/www/carlipa-online.com/carlipa-online'
alias cdbmt='cd /srv/www/beemeet.com/beemeet'
function cdsites { cd /srv/www/$1 }
