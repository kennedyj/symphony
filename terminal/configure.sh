#!/bin/bash

function usage {
cat << EOF
usage: $0 options

Configure the default terminal profile

OPTIONS:
   -h      Show this message
   -c      color scheme to use (light or dark)
   -t      terminal application (gnome, mate)
   -p      profile to configure [default]
   -o      use osx keybindings
EOF
}

term_app="gnome"
color_scheme="light"
PROFILE="Default"
OSX_KEYS=false

while getopts “hc:t:p:” OPTION
do
     case $OPTION in
         h)
             usage
             exit 1
             ;;
         c)
             color_scheme=$OPTARG
             ;;
         t)
             term_app=$OPTARG
             ;;
         p)
             PROFILE=$OPTARG
             ;;
         o)
             OSX_KEYS=true
             ;;
         ?)
             usage
             exit 0
             ;;
     esac
done

font="Source Code Pro Medium 10"

case "$color_scheme" in
'light')
# light.itermcolors
foreground_color="#535353"
background_color="#EBEBEB"
bold_color="#9B4D4F"
palette="#AAAAAA:#6D2E2F:#348235:#6E6F2E:#40499C:#6D3688:#004949:#313336:#9399A4:#7A444D:#88A945:#A7A25D:#458BB1:#B466C5:#277D7D:#323232"
;;
'dark')
foreground_color="#BBBBBB"
background_color="#1E211F"
bold_color="#FF7D7D"
palette="#000000:#B2494B:#3E9A3F:#C1C14F:#515BC4:#B159DE:#009696:#8F8F8F:#555555:#DA7886:#9FC651:#BDB669:#4F9FC9:#CA72DD:#48DBDB:#E5E5E5"
;;
*)
echo "color scheme '$color_scheme' not defined"
exit 1
;;
esac

case "$term_app" in
'gnome')
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/font --type string "$font"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/use_theme_colors --type bool "false"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/use_system_font --type bool "false"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/scrollback_unlimited --type bool 'true'
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/scrollbar_position --type string 'hidden'
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/default_show_menubar --type bool "false"
# colors
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/foreground_color --type string "$foreground_color"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/background_color --type string "$background_color"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/bold_color --type string "$bold_color"
gconftool-2 --set /apps/gnome-terminal/profiles/${PROFILE}/palette --type string "$palette"
# keybindings
if [ $OSX_KEYS == true ]
then
  echo "setting up osx keyboard shortcuts"
  gconftool-2 --set /apps/gnome-terminal/keybindings/copy --type string '<Super>c'
  gconftool-2 --set /apps/gnome-terminal/keybindings/paste --type string '<Super>v'
  gconftool-2 --set /apps/gnome-terminal/keybindings/prev_tab --type string '<Super>braceleft'
  gconftool-2 --set /apps/gnome-terminal/keybindings/next_tab --type string '<Super>braceright'
  gconftool-2 --set /apps/gnome-terminal/keybindings/new_window --type string '<Super>n'
  gconftool-2 --set /apps/gnome-terminal/keybindings/new_tab --type string '<Super>t'
else
  echo "setting up normal shortcuts"
  gconftool-2 --set /apps/gnome-terminal/keybindings/copy --type string '<Ctrl><Shift>c'
  gconftool-2 --set /apps/gnome-terminal/keybindings/paste --type string '<Ctrl><Shift>v'
  gconftool-2 --set /apps/gnome-terminal/keybindings/prev_tab --type string '<Ctrl>braceleft'
  gconftool-2 --set /apps/gnome-terminal/keybindings/next_tab --type string '<Ctrl>braceright'
  gconftool-2 --set /apps/gnome-terminal/keybindings/new_window --type string '<Ctrl>n'
  gconftool-2 --set /apps/gnome-terminal/keybindings/new_tab --type string '<Ctrl>t'
fi
;;
'mate')
PROFILE="default"
dconf write /org/mate/terminal/profiles/default/font "'$font'"
dconf write /org/mate/terminal/profiles/${PROFILE}/use-theme-colors "false"
dconf write /org/mate/terminal/profiles/${PROFILE}/scrollback-unlimited "true"
dconf write /org/mate/terminal/profiles/${PROFILE}/use-system-font "false"
dconf write /org/mate/terminal/profiles/${PROFILE}/scrollbar-position 'hidden'
dconf write /org/mate/terminal/profiles/${PROFILE}/default-show-menubar "false"
# keybindings
if [ $OSX_KEYS ]
then
  dconf write /org/mate/terminal/keybindings/copy '<Super>c'
  dconf write /org/mate/terminal/keybindings/paste '<Super>v'
  dconf write /org/mate/terminal/keybindings/prev-tab '<Super>braceleft'
  dconf write /org/mate/terminal/keybindings/next-tab '<Super>braceright'
  dconf write /org/mate/terminal/keybindings/new-window '<Super>n'
  dconf write /org/mate/terminal/keybindings/new-tab '<Super>t'
fi
# colors
dconf write /org/mate/terminal/profiles/${PROFILE}/background-color \"$background_color\"
dconf write /org/mate/terminal/profiles/${PROFILE}/foreground-color \"$foreground_color\"
dconf write /org/mate/terminal/profiles/${PROFILE}/bold_color \"$bold_color\"
dconf write /org/mate/terminal/profiles/${PROFILE}/palette \"$palette\"
dconf write /org/mate/terminal/profiles/${PROFILE}/bold-color-same-as-fg false
;;
*)
echo 'unsupported terminal type'
exit 1
;;
esac
