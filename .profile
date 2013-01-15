
# Adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# English
export LANG=en_US.UTF-8

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

alias cdcol="cd ~/Sites/carlipa-online/carlipa-online"
alias cdblk="cd ~/Sites/beelink/beelink"

function sshcol { ssh -p 2222 -A mgcrea@${1}.carlipa-online.com; }
alias cdcol="cd ~/Sites/carlipa-online/carlipa-online"
alias cdblk="cd ~/Sites/beelink/beelink"

alias apache2="sudo /opt/local/apache2/bin/apachectl"
