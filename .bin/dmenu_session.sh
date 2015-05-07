#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "screenshot\nlock\nexit\nshutdown\nreboot" | $DMENU)

case $choice in
	screenshot) sleep 1 && scrot ~/pics/screens/%Y-%m-%d-%T-screenshot.png & ;;
#	lock) xscreensaver-command -lock & ;;
	lock) slimlock & ;;
	exit) pkill -x panel; bspc quit & ;;
	shutdown) systemctl poweroff & ;;
	reboot) systemctl reboot & ;;
esac
