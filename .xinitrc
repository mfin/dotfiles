setxkbmap si -option 'ctrl:nocaps' &
xset m 0 &
xset r rate 300 30 &
xset b off &
xsetroot -cursor_name left_ptr &
xset fp rehash &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

feh --bg-center ~/pics/back.jpg &
compton -bcCGf -e 0.8 --no-fading-openclose --sw-opti &
xscreensaver -no-splash &
( sleep 10 && xss-lock -- xscreensaver-command -lock ) &
pulseaudio --start &
dunst &
unclutter &
udiskie &

eval $(ssh-agent) &
sxhkd -f 50 &
exec bspwm
