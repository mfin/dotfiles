setxkbmap si -option 'ctrl:nocaps' &
xset m 0 &
xset r rate 300 30 &
xset b off &
xsetroot -cursor_name left_ptr &
xset +fp /usr/share/fonts/local &
xset fp rehash &
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources &

feh --bg-center ~/pics/wallpaper-2942186.png &
# fix dims on dmenu: compton -bcCG -e 0.5 --no-fading-openclose --sw-opti --inactive-dim 0.3 --use-ewmh-active-win &
xscreensaver -no-splash &
( sleep 10 && xss-lock -- xscreensaver-command -lock ) &
pulseaudio --start &
dunst &
unclutter &
udiskie &

envfile="$HOME/.gnupg/gpg-agent.env"
if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
    eval "$(cat "$envfile")"
else
    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
fi
export GPG_AGENT_INFO
export SSH_AUTH_SOCK

eval $(ssh-agent) &
sxhkd -f 50 &
exec bspwm
