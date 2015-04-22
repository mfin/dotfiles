#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\nexit\nshutdown\nreboot\nscreenshot" | $DMENU)

case $choice in
	screenshot) scrot ~/pics/screens/%Y-%m-%d-%T-screenshot.png & ;;
	lock) slimlock & ;;
	exit) pkill -x panel; bspc quit & ;;
	shutdown) sudo shutdown now & ;;
	reboot) sudo reboot & ;;
esac
