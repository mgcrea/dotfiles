#/bin/bash

user=$(whoami)
chown $user:$user $HOME
cat ~/.dotfiles/.ssh/authorized_keys > $HOME/.ssh/authorized_keys
chown -R $user:$user $HOME/.ssh
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys
