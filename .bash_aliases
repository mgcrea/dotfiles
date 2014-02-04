
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

alias tf="tail -fn200"
alias json="python -mjson.tool"
alias static-py="python -m SimpleHTTPServer"
static-dev() { http-server $@ -c-1; chrome "http://localhost:8080"; }
tgz() { cd "$1"; tar -cvzf "./../$1.tgz" .; cd ..; }
purgekernel() { sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'); }

# Rights
alias chmod644="sudo chmod -R 644 ./ && sudo find ./ -type d -exec chmod 0755 {} \;"
alias chmod660="sudo chmod -R 660 ./ && sudo find ./ -type d -exec chmod 0770 {} \;"
alias chmod600="sudo chmod -R 600 ./ && sudo find ./ -type d -exec chmod 0700 {} \;"

# OSX
if [[ $OSTYPE =~ "darwin" ]]; then
  alias d="cd ~/Dropbox/Developer"
  alias p="cd ~/Dropbox/Projects"
  alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
  alias vlc="/Applications/VLC.app/Contents/MacOS/vlc"
  alias chrome="open -a /Applications/Google\ Chrome.app"
  alias chrome-dev="open /Applications/Google\ Chrome\ Canary.app --args --incognito --allow-file-access-from-files --disable-web-security"
  alias update="sudo softwareupdate -i -a; sudo port selfupdate; sudo port upgrade outdated; sudo npm update -g"
# *NIX
else
  alias st="rmate -p 2226"
  alias update="sudo apt-get update; sudo apt-get dist-upgrade -y; sudo apt-get upgrade -y; sudo npm update npm -g; sudo npm update -g"
  alias upgrade="update; sudo reboot; exit"
  alias chownwww="sudo chown -R www-data:www-data ."
  alias pbcopy="cat | nc -q0 localhost 2224"
fi;

# Git
alias gps="git push; git push --tags"
alias gpsf="git push --force; git push --tags --force"
alias gpl="git pull"
alias gs="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gtc="git clone -o github"
alias gc="git commit -m"

# Grunt
alias gtdocs="grunt docs; git add --all .; git commit -am 'chore(docs): update to latest master'; git push"

# Npm
alias npmlist="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./package.json')).dependencies).join(' ')\""
alias npmlistdev="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./package.json')).devDependencies).join(' ')\""
# Bower
alias bowerlist="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./bower.json')).dependencies).join(' ')\""
alias bowerlistdev="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./bower.json')).devDependencies).join(' ')\""
