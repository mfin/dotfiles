xrdb -merge ~/.Xresources
xset +fp /usr/share/fonts/local
xset +fp /home/mfin/.local/share/fonts/bitmap/envypn-font
xset fp rehash
xset m 0
xset r rate 300 30
xset b off

setxkbmap si -option 'ctrl:nocaps' &
xsetroot -cursor_name left_ptr &

nitrogen --restore &
xautolock -detectsleep -time 5 -locker slimlock &
pulseaudio --start &
dunst &
unclutter &
udiskie -2 &
