#!/bin/bash

# # Sublime
# normalize sublime config on mac and linux
mkdir -p $HOME/.config/
mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3/

ln -s $HOME/Library/Application\ Support/Sublime\ Text\ 3/ $HOME/.config/sublime-text-3

read -p "Remove existing sublime configuration (can not be undone)? [y,n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  rm -irf $HOME/.config/sublime-text-3/Packages/Default $HOME/.config/sublime-text-3/Packages/User
  ln -s $HOME/.symphony/sublime/default $HOME/.config/sublime-text-3/Packages/Default
  ln -s $HOME/.symphony/sublime/user $HOME/.config/sublime-text-3/Packages/User
fi

# Truecrypt
if [ -e "/Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt" ] && [ ! -e "/usr/bin/truecrypt" ]
then
  sudo ln -s /Applications/TrueCrypt.app/Contents/MacOS/TrueCrypt /usr/bin/truecrypt
fi
