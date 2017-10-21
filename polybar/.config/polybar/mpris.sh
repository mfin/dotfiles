#!/bin/bash
icon="music"

player_status=$(playerctl status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

if [[ $player_status = "Playing" ]]; then
    echo "$icon $metadata"
elif [[ $player_status = "Paused" ]]; then
    echo "$icon [paused] $metadata"
else
    echo ""
fi