#!/bin/bash

read -p "Install Adobe Source Code Pro font? [y,n] " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

# [Source Code Pro](http://www.google.com/fonts/specimen/Source+Code+Pro)
cd /tmp
curl -Ls 'http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip' -o /tmp/SourceCodePro_fonts.zip
unzip -q SourceCodePro_fonts.zip

OS_NAME=$(uname -s)

if [ "$OS_NAME" == "Linux" ]
then
  mkdir -p $HOME/.fonts
  cp /tmp/SourceCodePro_FontsOnly*/OTF/*.otf $HOME/.fonts/
fi

if [ "$OS_NAME" == "Darwin" ]
then
  cp /tmp/SourceCodePro_FontsOnly*/TTF/*.ttf $HOME/Library/Fonts/
fi

# cleanup
rm -rf /tmp/SourceCodePro_*

fi

# todo: add support for other fonts. This will require templating sublime configs....
# [Anonymous Pro](http://www.google.com/fonts/specimen/Anonymous+Pro)
# http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip

# [Deja Vu](http://dejavu-fonts.org/wiki/Main_Page)
# http://sourceforge.net/projects/dejavu/files/dejavu/2.34/dejavu-fonts-ttf-2.34.zip

# [Ubuntu Mono](http://www.google.com/fonts/specimen/Ubuntu+Mono)
# http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip
