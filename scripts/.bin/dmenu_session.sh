#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\npass\nnmcli\nexit\nshutdown\nreboot" | $DMENU)

case $choice in
	lock) slimlock & ;;
	exit) pkill -x panel; bspc quit & ;;
	shutdown) systemctl poweroff & ;;
	reboot) systemctl reboot & ;;
	nmcli) nmcli_dmenu & ;;
    pass) passmenu $ARGS & ;;
esac
