#!/bin/sh

#if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#    for f in /etc/X11/xinit/xinitrc.d/?* ; do
#        [ -x "$f" ] && . "$f"
#    done
#    unset f
#fi

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp $HOME/.fonts/bitmap/bitmap/termsyn-1.8.7/
xset +fp $HOME/.fonts/bitmap/bitmap/siji/
xset fp rehash
xset m 3/2
xset r rate 300 30
xset b off
xset s 120 180

setxkbmap si -option 'ctrl:nocaps' &
xsetroot -cursor_name left_ptr &

~/.fehbg &
compton --use-ewmh-active-win &
xscreensaver -no-splash &
xss-lock -- xscreensaver-command --lock &
dunst &
unclutter &
clipster -d &
( sleep 3 && stalonetray ) &
#~/.screenlayout/default.sh &

sxhkd &
#exec bspwm
