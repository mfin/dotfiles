#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\nexit\nshutdown\nreboot" | $DMENU)

case $choice in
	lock) xscreensaver-command -lock & ;;
	exit) pkill -x panel; bspc quit & ;;
	shutdown) sudo shutdown now & ;;
	reboot) sudo reboot & ;;
esac