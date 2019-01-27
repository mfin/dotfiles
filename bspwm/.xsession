#!/bin/sh

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts/bitmap-fonts/bitmap/dina/
xset fp rehash
xset m 3/2
xset r rate 300 30
xset b off
xset s 120

setxkbmap -layout si,gb -option grp:alt_shift_toggle -option caps:swapescape &
xsetroot -cursor_name left_ptr &

nitrogen --restore &
compton --use-ewmh-active-win &
udiskie &
dunst &
unclutter &
clipster -d &
light-locker --no-late-locking --lock-on-suspend &

caffeine &
dropbox &
blueman-applet &
nm-applet &
redshift-gtk &
usbguard-applet-qt &

sxhkd &
