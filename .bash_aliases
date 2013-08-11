
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
alias static-py="python -m SimpleHTTPServer"
alias static-dev="static -H '{\"Cache-Control\": \"no-cache, must-revalidate\"}' $*"

# Rights
alias chmod644="sudo chmod -R 644 ./ && sudo find ./ -type d -exec chmod 0755 {} \;"
alias chmod660="sudo chmod -R 660 ./ && sudo find ./ -type d -exec chmod 0770 {} \;"
alias chownwww="sudo chown -R www-data:www-data ./"

# OSX
if [[ $OSTYPE =~ "darwin" ]]; then
  alias st="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
  alias update='sudo softwareupdate -i -a; sudo npm update npm -g; sudo npm update -g; sudo port selfupdate; sudo port upgrade outdated'
# *NIX
else
  alias st="rmate -p 2226"
  alias update='sudo apt-get update; sudo apt-get dist-upgrade -y; sudo apt-get upgrade -y; sudo npm update npm -g; sudo npm update -g'
  alias upgrade="update; sudo reboot; exit"
  alias pbcopy="cat | nc -q0 localhost 2224"
fi;

# Git
alias gps="git push"
alias gpl="git pull"
alias gs="git status"
alias gco="git checkout"
alias gc="git commit -am"
