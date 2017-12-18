#!/bin/sh

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts/bitmap-fonts/bitmap/dina/
xset fp rehash
xset m 3/2
xset r rate 300 30
xset b off
xset s 120 180

setxkbmap si -option 'caps:swapescape' &
xsetroot -cursor_name left_ptr &

nitrogen --restore &
compton --use-ewmh-active-win &
xscreensaver -no-splash &
xss-lock -- xscreensaver-command --lock &
dunst &
unclutter &
clipster -d &

sxhkd &
