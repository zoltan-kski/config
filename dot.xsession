#!/bin/sh

PATH="$PATH:/home/zo/bin/"

xset -b
xset s off
xset -dpms
xset r rate 375
setxkbmap -option caps:none

if [ -f ~/.xinitrc_local ]; then
    sh ~/.xinitrc_local
fi

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

# disable tap-on-click
synclient MaxTapTime=0

# simple hint for "natural scrolling" via xinput
xinput set-prop 12 274 -91 91
# the 274 91 91 values are obtained via xinput list-props id | grep "Scrolling Distance"

conky
dropbox start
blueman-applet &
startfluxbox
