#!/bin/bash

# do OS detection (ubuntu, redhat, etc)
if [ -e "$(which lsb_release)" ]
then
  osname=$(lsb_release -i | cut -d ":" -f 2 | awk '{print $1}')

  if [ "$osname" == "ubuntu" ]
  then
    echo "do ubuntu"
  fi
fi

bash $SYMPHONY/terminal/configure.sh
