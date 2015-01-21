#!/bin/bash

# remove and install vim settings
read -p "Remove existing vim configuration (can not be undone)? [y,n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  if [ -e "$HOME/.vim" ]
  then
    rm -irf $HOME/.vim
  fi
  if [ -e "$HOME/.vimrc" ]
  then
    rm $HOME/.vimrc
  fi

  ln -s $HOME/.symphony/vim $HOME/.vim
  ln -s $HOME/.vim/configs/vimrc $HOME/.vimrc
fi

# remove and install tmux settings
if [ -e "$HOME/.tmux.conf" ]
then
  read -p "Remove existing tmux configuration (can not be undone)? [y,n] " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    if [ -e "$HOME/.tmux.conf" ]
    then
      rm $HOME/.tmux.conf
    fi
    ln -s $HOME/.symphony/dotfiles/tmux.conf $HOME/.tmux.conf
  fi
else
  ln -s $HOME/.symphony/dotfiles/tmux.conf $HOME/.tmux.conf
fi

OS_NAME=$(uname -s | awk '{print tolower($0)}')

# do platform specific things
if [ -e "$HOME/.symphony/bootstrap/os/$OS_NAME.sh" ]
then
  bash $HOME/.symphony/bootstrap/os/$OS_NAME.sh
fi

bash $HOME/.symphony/fonts/install.sh

# load the profile
echo "Add the following to your .bashrc or .profile"
echo <<EOF
# Only load if we are interactive
case $- in
  *i*)
    PROFILE_LOAD="\$HOME/.symphony/dotfiles/profile"
    if [ -e "$PROFILE_LOAD" ];
    then
      [ -s "\$PROFILE_LOAD" ] && . "\$PROFILE_LOAD"
    fi
    ;;
  *) ;;
esac
EOF
