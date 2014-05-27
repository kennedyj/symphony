#!/bin/bash

# add user to sudoers no password
read -p "Allow sudo with no password for $USER? [y,n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers > /dev/null
fi

# do OS detection (ubuntu, redhat, etc)
if [ -e "$(which lsb_release)" ]
then
  osname=$(lsb_release -i | cut -d ":" -f 2 | awk '{print $1}')

  if [ "$osname" == "Ubuntu" ]
  then
    for p in $HOME/.symphony/bootstrap/os/ubuntu/*
    do
      read -p "Run $(basename $p)? [y,n] " -n 1 -r
      echo    # (optional) move to a new line
      if [[ $REPLY =~ ^[Yy]$ ]]
      then
        [ -f $p ] && . $p
      fi
    done
  fi
fi
