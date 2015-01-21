#!/bin/bash

read -p "Install Adobe Source Code Pro font? [y,n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

# [Source Code Pro](https://github.com/adobe-fonts/source-code-pro)
FONT_URL="https://github.com/adobe-fonts/source-code-pro/archive/1.017R.tar.gz"

cd /tmp
curl -Ls "$FONT_URL" | tar xvz

OS_NAME=$(uname -s)

if [ "$OS_NAME" == "Linux" ]
then
  mkdir -p $HOME/.fonts
  cp /tmp/source-code-pro-*/OTF/*.otf $HOME/.fonts/
fi

if [ "$OS_NAME" == "Darwin" ]
then
  cp /tmp/source-code-pro-*/TTF/*.ttf $HOME/Library/Fonts/
fi

# cleanup
rm -rf /tmp/source-code-pro-*
fi

# todo: add support for other fonts. This will require templating sublime configs....
# [Anonymous Pro](http://www.google.com/fonts/specimen/Anonymous+Pro)
# http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip

# [Deja Vu](http://dejavu-fonts.org/wiki/Main_Page)
# http://sourceforge.net/projects/dejavu/files/dejavu/2.34/dejavu-fonts-ttf-2.34.zip

# [Ubuntu Mono](http://www.google.com/fonts/specimen/Ubuntu+Mono)
# http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip
