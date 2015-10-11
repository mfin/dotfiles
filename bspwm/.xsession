xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/envypn
xset fp rehash
xset m 0
xset r rate 300 30
xset b off

setxkbmap si -option 'ctrl:nocaps' &
xsetroot -cursor_name left_ptr &

nitrogen --restore &
compton --sw-opti --use-ewmh-active-win &
xautolock -detectsleep -time 5 -locker slimlock &
pulseaudio --start &
dunst &
unclutter &
udiskie -2 &
( sleep 3 && stalonetray ) &

sxhkd -f 50 &
