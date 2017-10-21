#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\nexit\nshutdown\nreboot" | $DMENU)

case $choice in
	lock) dm-tool lock & ;;
	exit) bspc quit & ;;
	shutdown) poweroff & ;;
	reboot) reboot & ;;
esac
