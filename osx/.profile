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

# Use Python binaries
export PATH="/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin":$PATH

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
  . $BREW_PREFIX/etc/bash_completion
fi
# Macport Bash completion
if [ -f $PORT_PREFIX/etc/bash_completion ]; then
    . $PORT_PREFIX/etc/bash_completion
fi

# Node Version Manager
if [ -d "$BREW_PREFIX/opt/nvm" ]; then
  source $BREW_PREFIX/opt/nvm/nvm.sh
  export NVM_DIR=~/.nvm
  export PATH=$NVM_DIR/current/bin:$PATH
fi

# Docker
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

# Custom aliases
function sshcol { ssh ${1}.carlipa-online.com; }
#function sshcolp { ssh -p 2222 -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@${*}; }
function sshcolp { ssh -p 22 -A -L27017:127.0.0.1:27017 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no carlipa@player-${1}.local; }
function sshcoltp() { ssh -At root@tesla.local ssh -p 22 -L27017:127.0.0.1:27017 -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -At carlipa@player-${1}.local; }
function cgzapp() { cd "$1"; tar -cvzf "./../${1%/}.cgz" . --exclude ".DS_Store" --exclude "*/.tmp" --exclude "./.git" --exclude "./dist" --exclude "./admin/dist" --exclude "*/node_modules" --exclude ./test; cd ..; }
function cgz() { cd "$1"; tar -cvzf "./../${1%/}.cgz" . --exclude ".DS_Store" --exclude "*/.tmp" --exclude "./.git" --exclude "./app" --exclude "./admin/app" --exclude "*/node_modules" --exclude ./test; cd ..; }
function cgtw() { sudo route delete default; sudo route add default 192.168.0.23; }
