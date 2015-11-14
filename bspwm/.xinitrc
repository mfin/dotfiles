#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp /home/mfin/.local/share/fonts/bitmap/candy-font
xset fp rehash
xset m 0
xset r rate 300 30
xset b off

setxkbmap si -option 'ctrl:nocaps' &
xsetroot -cursor_name left_ptr &

~/.fehbg &
compton --sw-opti --use-ewmh-active-win &
xautolock -detectsleep -time 5 -locker slimlock &
dunst &
unclutter &
( sleep 3 && stalonetray ) &

sxhkd -f 50 &
exec bspwm
