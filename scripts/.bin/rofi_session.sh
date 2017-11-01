#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU='dmenu -i'
fi

choice=$(echo -e "lock\nsuspend\nshutdown\nreboot" | rofi -dmenu)

case $choice in
	lock) xscreensaver-command --lock & ;;
	suspend) systemctl suspend & ;;
	shutdown) systemctl poweroff & ;;
	reboot) systemctl reboot & ;;
esac
