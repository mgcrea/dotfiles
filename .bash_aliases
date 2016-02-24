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
alias c="clear"
alias h="cd ~"
alias ..="cd .."
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

# Rights
function chmod644() { chmod -R u+rwX,go+rX,go-w ${1:-*}; }
function chmod660() { chmod -R ug+rwX,o-rwx ${1:-*}; }
function chmod600() { chmod -R u+rwX,go-rwx ${1:-*}; }

# Git
alias gps="git push; git push --tags"
alias gpsf="git push --force; git push --tags --force"
alias gpl="git pull"
alias gs="git status"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gtc="git clone -o github"
alias gc="git commit -m"
function gtp() { git add --all .; git ci -am "feat(update): ${1:-minor changes}"; git push; }
function gtg() { git ci -am "chore(release): cut the `cat package.json | jq -r .version` release"; git tag v`cat package.json | jq -r .version`; git push; git push --tags; npm publish; }
function gtpg() { git checkout -b tmp; git branch -D gh-pages; git checkout --orphan gh-pages; git add --all .; git ci -am "docs(release): build `cat ./../package.json | jq -r .version` docs pages"; git push github gh-pages:gh-pages --force; git branch -D tmp; }
function gtpm() { git checkout -b tmp; git branch -D master; git checkout --orphan master; git add --all .; git ci -am "chore(release): build `cat ./../package.json | jq -r .version`"; git push github master:master --force; git branch -D tmp; }

# Ssh
alias sshc="find ~/.ssh/conf.d -type f -name '*.conf' -print0 | xargs -0 -I file cat file > ~/.ssh/config"
function sshf() { find ~/.ssh/conf.d -type f -name '*.conf' -print0 | xargs -0 -I file grep ^Host.*$1 -i file | cut -c6-; }
alias sshp="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
alias sshpw="sshp -o PreferredAuthentications=password -o PubkeyAuthentication=no"
alias clean-hosts="sed '/^192/ d' -i ~/.ssh/known_hosts; sed '/^player-/ d' -i ~/.ssh/known_hosts; sed '/^10/ d' -i ~/.ssh/known_hosts"
function randpw() { < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-16}; echo; }

# Dev
alias json="python -mjson.tool"
alias post-json="curl -X POST -H \"Content-Type: application/json\" -d"
alias get-json="curl -X GET -H \"Content-Type: application/json\""
alias static-py="python -m SimpleHTTPServer"
alias static-dev="http-server -c-1"
alias scan-local="sudo nmap -sP -n $@"
alias nbu="ncu -m bower"
function lgulp() { $(npm bin)/gulp $@; }
function lbabel() { $(npm bin)/babel $@; }
function lmocha() { $(npm bin)/mocha $@; }

# Docker
alias dk="docker"
alias dki="docker inspect"
alias dkr="docker restart"
alias dkl="docker logs --tail=20 -f"
alias dkc="docker-compose"
alias dkm="docker-machine"
function dkb() { docker exec -it $1 script -q -c "/bin/bash" /dev/null; }
function dkl() { docker logs -f $1; }
function docker-clean() { docker rm -f \`docker ps -a -q\`; docker rmi `docker images | awk '/^<none>/ { print $3 }'`; }
function docker-ip() { docker inspect ${1} | jq -r .[0].NetworkSettings.IPAddress; }

# Ansible
alias asb="ansible -s -i inventory -m shell -a"
alias asbp="ansible -s -i inventory_production -m shell -a"
alias apb="ansible-playbook -i inventory playbook.yml"
alias apbp="ansible-playbook -i inventory_production playbook.yml"

# Npm
alias nrun="npm start"
alias ntest="npm test"
alias nbuild="npm run build"
alias npmzh="npm --registry=https://registry.npm.taobao.org"
alias ncuu="ncu --upgradeAll"
alias bcu="ncu -m bower"
alias bcuu="ncu -m bower --upgradeAll"
alias cnpm="npm --registry=https://registry.npm.taobao.org --cache=$HOME/.npm/.cache/cnpm --disturl=https://npm.taobao.org/dist --userconfig=$HOME/.cnpmrc"
alias npm-list="cat package.json | jq .dependencies | jq 'keys[]' -r | xargs"
alias npm-list-dev="cat package.json | jq .devDependencies | jq 'keys[]' -r | xargs"
function npm-link-dev() { npm link `cat package.json | jq .devDependencies | jq 'keys[]' -r | xargs`; }

# Bower
alias bowerlist="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./bower.json')).dependencies).join(' ')\""
alias bowerlistdev="node -p \"Object.keys(JSON.parse(require('fs').readFileSync('./bower.json')).devDependencies).join(' ')\""

# Custom OSX
if [[ $OSTYPE =~ "darwin" ]]; then

  # Finder
  alias open="open ."
  alias show-files='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
  alias hide-files='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
  alias d="cd ~/Developer"
  alias p="cd ~/Projects"

  # Applications
  alias st="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
  alias nw="/Applications/node-webkit.app/Contents/MacOS/node-webkit"
  alias vlc="/Applications/VLC.app/Contents/MacOS/vlc"
  alias cvlc="/Applications/VLC.app/Contents/MacOS/VLC -I dummy"
  alias chrome="open -a /Applications/Google\ Chrome.app"
  alias chrome-dev="open -a /Applications/Google\ Chrome\ Canary.app --args --incognito --allow-file-access-from-files --disable-web-security"
  alias syncthing-gui="syncthing -browser-only"
  alias syncthing-log="tail -f /usr/local/var/log/syncthing.log"

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
  function ssh-docker() { ssh -At docker@boot2docker ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At root@$(docker inspect ${1} | jq -r .[0].NetworkSettings.IPAddress) $2; }
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

# Custom *NIX
else

  # Docker
  alias d="cd /srv/docker"
  function ssh-docker() { ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At root@$(docker inspect ${1} | jq -r .[0].NetworkSettings.IPAddress) $2; }
  function docker-ls { docker inspect --format='{{.Name}}' $(sudo docker ps -aq --no-trunc) | cut -c2-; }

  alias st="jmate"
  alias j="autojump"
  alias bubu="sudo apt-get update; sudo apt-get dist-upgrade -y"
  alias pbcopy="cat | nc -q0 localhost 2224"
  function purgekernel() { sudo apt-get remove --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'); }
  function chownwww() { sudo chown -R www-data:www-data ${1:-*}; }

fi;
