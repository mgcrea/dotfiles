# ~/.bash_aliases: executed by bash(1) for non-login shells.

# Directory
alias ls="ls -hF --color=auto"
alias dir="ls --color=auto --format=vertical"
alias vdir="ls --color=auto --format=long"
alias ll="ls --color=auto -lh"
alias la="ls --color=auto -la"
alias l="ls --color=auto -CF"
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'
function mkd() { mkdir -p "$@" && cd "$_"; }
function cdw() { cd "/srv/www/$1"; }
function tgz() { cd "$1"; tar --exclude=.DS_Store -cvzf "./../${1%/}.tgz" .; cd ..; }
function fdir() { find . -maxdepth 1 -mindepth 1 -type d -print0 | xargs -0 -I '{}' sh -c "cd {}; $@; cd -"; }

# Miscellaneous
alias clear="clear && printf '\e[3J'"
alias c="clear"
alias h="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias cd..="cd .."
alias cd-="cd -"
alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias grep="grep --color"
alias tf="tail -fn200"
alias h?="history | grep"
alias hr="printf '%*s\n' \"${COLUMNS:-$(tput cols)}\" '' | tr ' ' ="
function rename() { find . -type f -name "*.${1}" | sed -e "p;s/\.${1}$/.${2}/" | xargs -n2 echo; }

# Rights
alias ssu="sudo -s"
function chmodx() { chmod -R ugo-x,ugo+X ${1:-.*}; }
function chmod644() { chmod -R ugo-x,u+rwX,go+rX,go-w ${1:-.*}; }
function chmod660() { chmod -R ug-x,ug+rwX,o-rwx ${1:-.*}; }
function chmod600() { chmod -R u-x,u+rwX,go-rwx ${1:-.*}; }

# Git
alias gps="git push; git push --tags"
alias gpsf="git push --force; git push --tags --force"
alias gpl="git pull"
alias gpr="git pull --rebase"
alias gs="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gtc="git clone -o github"
alias gc="git commit -m"
alias gaa="git add --all"
alias gcnv="git commit --no-verify -m"
function gtp() { git add --all .; git ci --no-verify -am "feat(update): ${1:-minor changes}"; git push; }
function gtg() {
  VERSION=`cat package.json | jq -r .version`
  git ci -am "chore(release): cut the ${VERSION} release";
  git tag v${VERSION};
  git push; git push --tags;
  npm publish;
}
function gtgd() {
  VERSION=`cat Makefile | grep 'IMAGE_VERSION :=' | cut -c18-`
  git ci -am "chore(release): cut the ${VERSION} release";
  git tag v${VERSION};
  git push; git push --tags;
}

# Ssh
alias sshc="find ~/.ssh/conf.d -type f -name '*.conf' -print0 | xargs -0 -I file cat file > ~/.ssh/config"
function sshf() { find ~/.ssh/conf.d -type f -name '*.conf' -print0 | xargs -0 -I file grep ^Host.*$1 -i file | cut -c6-; }
alias sshp="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias sshpw="sshp -o PreferredAuthentications=password -o PubkeyAuthentication=no"
alias sshfp="ssh-keygen -l -E md5 -f"
alias clean-hosts="sed '/^192/ d' -i ~/.ssh/known_hosts; sed '/^player-/ d' -i ~/.ssh/known_hosts; sed '/^10/ d' -i ~/.ssh/known_hosts"
function randpw() { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16}; echo; }
alias sshps="sshp -p2222 -A"
alias rsyncs="rsync -avzP -e 'ssh -p2222' --rsync-path 'sudo rsync'"

# Network
function lsport() { lsof -i :$1; }
function killport() { lsof -i :$1 | tail -n-1 | awk '{print $2}' | xargs kill -9; }
alias sslcheck="openssl s_client -connect"

# Developer

alias isodate="date -u +'%Y-%m-%dT%H:%M:%SZ'"
alias json="python -mjson.tool"
alias post-json="curl -X POST -H \"Content-Type: application/json\" -d"
alias get-json="curl -X GET -H \"Content-Type: application/json\""
alias static-py="python -m SimpleHTTPServer"
alias static-dev="http-server -c-1"
alias scan-local="sudo nmap -sP -n $@"
alias nbu="ncu -m bower"
alias sprunge="curl -F 'sprunge=<-' http://sprunge.us"

## Tmux

alias tmuxa="tmux a -t"
alias tmuxc="tmux new -s"
alias tmuxk="tmux kill-session -t"

## NodeJS

### npm
alias npmr="npm run"
alias npms="npm start"
alias npmt="npm test"

### npm-check-updates
alias ncuu="ncu --upgradeAll"
alias bcu="ncu -m bower"
alias bcuu="ncu -m bower --upgradeAll"

### yarn
alias y="yarn"
alias ys="yarn start"
alias yr="yarn run"
alias yt="yarn test"

## Docker
alias dk="docker"
alias dkps="docker ps"
alias dki="docker inspect"
alias dkr="docker restart"
alias dkl="docker logs --tail=200 -f"
alias dkc="docker-compose"
alias dkcl="docker-compose logs --tail=200 -f"
alias dkcr="docker-compose restart"
alias dkm="docker-machine"
function dkb() { docker exec -it $1 script -q -c "TERM=xterm /bin/bash" /dev/null; }
function dkrb() { docker run --rm -it -v /tmp:/tmp/host ${1:-"ubuntu:18.04"} script -q -c "TERM=xterm /bin/bash" /dev/null; }
function dkjl() { journalctl -b CONTAINER_NAME=$1 -e ${@:2}; }
function dkip() { docker inspect $1 | jq -r .[0].NetworkSettings.IPAddress; }
function docker-clean() {
  docker rm -v $(docker ps --filter status=exited -q 2>/dev/null) 2>/dev/null
  docker rmi $(docker images --filter dangling=true -q 2>/dev/null) 2>/dev/null
  docker volume rm $(docker volume ls -qf dangling=true 2>/dev/null) 2>/dev/null
}

## Kubernetes
alias kb="kubectl"

## Ansible
alias asb="ansible -s -i inventory -m shell -a"
alias asbp="ansible -s -i inventories/ -m shell -a"
alias apb="ansible-playbook -i inventory playbook.yml"
alias apbp="ansible-playbook -i inventories/ playbook.yml"

# Custom OSX
if [[ $OSTYPE =~ "darwin" ]]; then

  # Finder
  alias open="open ."
  alias show-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hide-files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
  alias d="cd ~/Developer"
  alias p="cd ~/Projects"

  # Applications
  alias code="/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code"
  alias st="code"
  alias stt="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
  alias vlc="/Applications/VLC.app/Contents/MacOS/vlc"
  alias mpv="/Applications/mpv.app/Contents/MacOS/mpv"
  alias cvlc="/Applications/VLC.app/Contents/MacOS/VLC -I dummy"
  alias chrome="open -a /Applications/Google\ Chrome.app"
  alias canary="open -a /Applications/Google\ Chrome\ Canary.app"
  alias firefox="open -a /Applications/Firefox.app"
  alias chrome-dev="open -a /Applications/Google\ Chrome\ Canary.app --args --incognito --ignore-certificate-errors --allow-file-access-from-files --disable-web-security --user-data-dir"
  alias electron="/Applications/Electron.app/Contents/MacOS/Electron"
  alias syncthing-gui="syncthing -browser-only"
  alias syncthing-log="tail -f /usr/local/var/log/syncthing.log"
  function google() { open -a /Applications/Google\ Chrome.app "http://www.google.com/search?q=$*"; }
  function pdfmerge() { /usr/local/bin/gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$1 ${@:2}; }

  # Spotify
  alias spotify-artist="osascript -e'tell application \"Spotify\"' -e'get artist of current track' -e'end tell'"
  alias spotify-title="osascript -e'tell application \"Spotify\"' -e'get name of current track' -e'end tell'"
  function spotify-song() { echo -e "`spotify-artist` - `spotify-title`"; }
  function spotify-lyrics() { hr; spotify-song; hr; curl -s --get "https://makeitpersonal.co/lyrics" --data-urlencode "artist=`spotify-artist`" --data-urlencode "title=`spotify-title`"; echo -e "\n"; }

  # Services
  # tf /usr/local/var/log/syncthing.log
  function service() {
    case $2 in
      status)
        pid=$(ps ax | grep -m1 $1' ' | grep -v grep | awk '{print $1}')
        [[ $pid != "" ]] && echo "$1 start/running, process $pid" || echo "$1 stop/waiting"
      ;;
      stop)
        plist=$(find ~/Library/LaunchAgents /Library/LaunchAgents -iname '*'$1'*.plist' | head -n1)
        [[ $plist != "" ]] && launchctl unload "$plist" && echo "$1 stop/waiting" || echo "$1: unrecognized service"
      ;;
      start)
        plist=$(find ~/Library/LaunchAgents /Library/LaunchAgents -iname '*'$1'*.plist' | head -n1)
        [[ $plist != "" ]] && launchctl load "$plist" && echo "$1 start/running" || echo "$1: unrecognized service"
      ;;
      restart)
        service $1 stop && service $1 start
      ;;
      *)
        echo "Usage: service $1 {start|stop|restart|status}"
      ;;
    esac;
  }

  # Docker
  alias boot2docker="bash --login '/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh'"
  function ssh-docker() { ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At root@$(docker inspect ${1} | jq -r .[0].NetworkSettings.IPAddress) $2; }
  function docker-ls { docker inspect --format='{{.Name}}' $(docker ps -aq --no-trunc) | cut -c2-; }

  # Homebrew
  alias bubu="brew update && brew upgrade"

  # NodeJS
  function nvm-upgrade() { nvm install stable --reinstall-packages-from=`nvm current`; }

  function flushdnsnew() { sudo discoveryutil mdnsflushcache; sudo discoveryutil udnsflushcaches; }
  function flushdns() { dscacheutil -flushcache; sudo killall -HUP mDNSResponder; }
  function marked() { open -a /Applications/Marked\ 2.app/Contents/MacOS/Marked\ 2 "`pwd`/$1"; }
  function open-static() { open -a /Applications/Google\ Chrome.app "http://localhost:8080"; http-server $@ -c-1; }
  alias update="sudo softwareupdate -i -a; sudo port selfupdate; sudo port upgrade outdated; sudo npm update -g"
  function chownwww() { sudo chown -R `whoami`:staff ${1:-*}; }
  function dmg() { hdiutil create -volname "$(basename "$1")" -srcfolder "$1" -ov -format UDZO "$(basename "$1").dmg"; }
  alias lscolp="dns-sd -B _http._tcp"
  alias lsavahi="dns-sd -B _services._dns-sd._udp"
  alias cdvp="cd cordova; cordova prepare; cd -"
  alias dunmount="diskutil unmountDisk"
  alias lsusb="ioreg -p IOUSB -l -w 0"

# Custom *NIX
else

  # Docker
  alias d="cd /srv/docker"
  function ssh-docker() { ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At root@$(docker inspect ${1} | jq -r .[0].NetworkSettings.IPAddress) $2; }
  function docker-ls { docker inspect --format='{{.Name}}' $(sudo docker ps -aq --no-trunc) | cut -c2-; }

  function st() { touch $1; jmate $1; }
  # alias j="autojump"
  function j() { cd `autojump $@`; }
  alias bubu="sudo apt update; sudo apt upgrade -y"
  alias pbcopy="cat | nc -q0 localhost 2224"
  function purgekernel() { sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'); }
  function chownwww() { sudo chown -R www-data:www-data ${1:-*}; }

fi;
