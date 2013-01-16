# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Use English
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# use the GNU tools by default
export PATH=/opt/local/libexec/gnubin:$PATH

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# MacPorts Bash shell command completion
if [ -f /opt/local/etc/bash_completion ]; then
    . /opt/local/etc/bash_completion
fi

# Custom aliases
alias apache2="sudo /opt/local/apache2/bin/apachectl"
alias cdcol="cd ~/Sites/carlipa-online/carlipa-online"
alias cdblk="cd ~/Sites/beelink/beelink"

# Ssh aliases
alias sshblk="ssh -p2222 mgcrea@beelinkapp.com -A"
function sshcol { ssh -p 2222 -A mgcrea@${1}.carlipa-online.com; }
function sshcolp { ssh -p2222 -A -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no user@${*}; }
