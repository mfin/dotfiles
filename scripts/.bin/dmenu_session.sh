#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\nnmcli\nscreenshot\nexit\nshutdown\nreboot" | $DMENU)

case $choice in
	screenshot) sleep 1 && scrot ~/pics/screens/%Y-%m-%d-%T-screenshot.png & ;;
	lock) slimlock & ;;
	exit) pkill -x panel; bspc quit & ;;
	shutdown) systemctl poweroff & ;;
	reboot) systemctl reboot & ;;
	nmcli) nmcli_dmenu & ;;
esac
