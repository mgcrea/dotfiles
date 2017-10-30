# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Use English
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Packages managers
export BREW_PREFIX=/usr/local

# limit.maxfiles.plist and limit.maxproc.plist
ulimit -n 65536
ulimit -u 2048

# Use the GNU tools by default
if [ -d "$BREW_PREFIX/bin" ]; then
  export PATH=$BREW_PREFIX/bin:$BREW_PREFIX/sbin:$PATH
fi
if [ -d "$BREW_PREFIX/opt/coreutils/libexec" ]; then
  export PATH=$BREW_PREFIX/opt/coreutils/libexec/gnubin:$BREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH
  export MANPATH=$BREW_PREFIX/opt/coreutils/libexec/gnuman:$MANPATH
fi

# Use NPM module binaries
export PATH=$HOME/node_modules/.bin:$PATH

# Use Android SDK tools
export PATH=$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$PATH
# export PATH="/Applications/Android Studio.app/sdk/build-tools/android-4.4W":$PATH

# Use PlatformIO toolchain
export PATH=$HOME/.platformio/packages/toolchain-atmelavr/bin:$PATH

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Include .osxrc if it exists
if [ -f "$HOME/.osxrc" ]; then
    . "$HOME/.osxrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d $HOME/.bin ]; then
    PATH=$HOME/.bin:$PATH
fi

# Homebrew Bash completion
if [ -f $BREW_PREFIX/etc/bash_completion ]; then
  . $BREW_PREFIX/etc/bash_completion
  . $BREW_PREFIX/etc/bash_completion.d/git-completion.bash
  . $BREW_PREFIX/etc/bash_completion.d/git-prompt.sh
fi
# Homebrew Autojump
if [ -s $BREW_PREFIX/etc/profile.d/autojump.sh ]; then
  . $BREW_PREFIX/etc/profile.d/autojump.sh
fi
# Homebrew Nvm
export NVM_DIR=$HOME/.nvm
if [ -s $BREW_PREFIX/opt/nvm/nvm.sh ]; then
  . $BREW_PREFIX/opt/nvm/nvm.sh
fi
