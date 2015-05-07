#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap si -option 'ctrl:nocaps' &
xset m 0 &
xset r rate 300 30 &
xset b off &
xsetroot -cursor_name left_ptr &
xset +fp /usr/share/fonts/local &
xset fp rehash &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

nitrogen --restore &
compton --sw-opti --use-ewmh-active-win &
#xscreensaver -no-splash &
#( sleep 10 && xss-lock -- xscreensaver-command -lock ) &
( sleep 10 && xss-lock -- slimlock ) &
pulseaudio --start &
dunst &
unclutter &
udiskie &
mopidy &

sxhkd -f 50 &

exec bspwm

