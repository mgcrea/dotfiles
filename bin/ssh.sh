#/bin/bash

user=${1:-$whoami}
if [[ $OSTYPE =~ "darwin" ]]; then
  home="/Users/$user"
else
  home="/home/$user"
fi;

chown $user:$user $HOME
cat ~/.dotfiles/.ssh/authorized_keys > $HOME/.ssh/authorized_keys
chown -R $user:$user $HOME/.ssh
chmod 755 $HOME
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys
