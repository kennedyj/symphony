#!/bin/bash

# [Source Code Pro](http://www.google.com/fonts/specimen/Source+Code+Pro)
if [ "$(uname -s)" == "Linux" ]
then
  mkdir -p $HOME/.fonts
  cd /tmp
  wget 'http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-1.017.zip'
  unzip SourceCodePro*.zip
  cp SourceCodePro_FontsOnly*/OTF/*.otf ~/.fonts/
  rm -rf SourceCodePro_*
fi

# [Anonymous Pro](http://www.google.com/fonts/specimen/Anonymous+Pro)
# http://www.marksimonson.com/assets/content/fonts/AnonymousPro-1.002.zip

# [Deja Vu](http://dejavu-fonts.org/wiki/Main_Page)
# http://sourceforge.net/projects/dejavu/files/dejavu/2.34/dejavu-fonts-ttf-2.34.zip

# [Ubuntu Mono](http://www.google.com/fonts/specimen/Ubuntu+Mono)
# http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip
