# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Use English
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Pacakges managers
export BREW_PREFIX=/usr/local
export PORT_PREFIX=/opt/local

# Use the GNU tools by default
if [ -d "$BREW_PREFIX/bin" ]; then
  export PATH=$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH
fi
if [ -d "$BREW_PREFIX/opt/coreutils/libexec" ]; then
  export PATH=$BREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH
  export MANPATH=$BREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH
fi
if [ -d "$PORT_PREFIX/libexec" ]; then
  export PATH=$PORT_PREFIX/bin:$PORT_PREFIX/sbin:$PATH
  export PATH=$PORT_PREFIX/libexec/gnubin:$PATH
fi

# Use NPM module binaries
export PATH=$HOME/node_modules/.bin:$PATH

# Use Android SDK tools
export PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH
# export PATH="/Applications/Android Studio.app/sdk/build-tools/android-4.4W":$PATH

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.bin" ]; then
    PATH=$HOME/.bin:$PATH
fi
# Homebrew Bash completion
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash
fi
# Macport Bash completion
if [ -f $PORT_PREFIX/etc/bash_completion ]; then
    . $PORT_PREFIX/etc/bash_completion
fi

# Node Version Manager
if [ -d "$BREW_PREFIX/opt/nvm" ]; then
  export NVM_DIR=$HOME/.nvm
  source $BREW_PREFIX/opt/nvm/nvm.sh
  export PATH=$(dirname $(which node)):$PATH
fi

# Docker
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"

# Custom aliases
function sshcol { ssh ${1}.carlipa-online.com; }
function sshcio { ssh ${1}.carlipa.io; }
#function sshcolp { ssh -p 2222 -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@${*}; }
function sshcolp { sshc; ssh -p 22 -A -L5900:127.0.0.1:5900 -L8080:127.0.0.1:8080 -L9080:127.0.0.1:9080 -L9222:127.0.0.1:9222 -L27017:127.0.0.1:27017 -L6379:127.0.0.1:6379 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no carlipa@player-${1}.${2:-local}; }
function sshcols { sshc; ssh -p 22 -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no carlipa@server-${1}.local; }
function sshcoltp() { ssh -At root@tesla.local ssh -p 22 -L9222:127.0.0.1:9222 -L27017:127.0.0.1:27017 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At carlipa@player-${1}.local; }
function cgzapp() { cd "$1"; tar -cvzf "./../${1%/}.cgz" . --exclude ".DS_Store" --exclude "*/.tmp" --exclude "./.git" --exclude "./dist" --exclude "./admin/dist" --exclude "*/node_modules" --exclude ./test; cd ..; }
function cgz() { cd "$1"; tar -cvzf "./../${1%/}.cgz" . --exclude ".DS_Store" --exclude "*/.tmp" --exclude "./.git" --exclude "./app" --exclude "./admin/app" --exclude "*/node_modules" --exclude ./test; cd ..; }
function cgtw() { sudo route delete default; sudo route add default 192.168.0.${1:-23}; }
