#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap si -option 'ctrl:nocaps' &
xset m 0 &
xset r rate 300 30 &
xset b off &
xsetroot -cursor_name left_ptr &
xset +fp /usr/share/fonts/local && xset +fp /usr/share/fonts/artwiz-fonts-ibx &
xset fp rehash &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

nitrogen --restore &
compton --sw-opti --use-ewmh-active-win &
xautolock -detectsleep -time 5 -locker slimlock &
pulseaudio --start &
dunst &
unclutter &
udiskie -2 &

sxhkd -f 50 &

exec bspwm
