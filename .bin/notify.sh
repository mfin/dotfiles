#!/bin/bash

notify-send "time      vol     bat" "`date +'%H:%M'`     `pulseaudio-ctl current`     `cat /sys/class/power_supply/BAT0/capacity`%"
