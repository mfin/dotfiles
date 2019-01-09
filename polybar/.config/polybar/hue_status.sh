#!/bin/bash

LIGHT1=$(hue lights 1 | cut -d' ' -f5)
LIGHT2=$(hue lights 2 | cut -d' ' -f5)
LIGHT_ICON=

XRDB_YELLOW=$(xrdb -query | grep color3)
XRDB_BLACK=$(xrdb -query | grep color8)
LIGHT_ON_COLOR="${XRDB_YELLOW: -7}"
LIGHT_OFF_COLOR="${XRDB_BLACK: -7}"

if [ "$LIGHT1" == "on" ]; then
    COLOR1=$LIGHT_ON_COLOR
else COLOR1=$LIGHT_OFF_COLOR
fi

if [ "$LIGHT2" == "on" ]; then
    COLOR2=$LIGHT_ON_COLOR
else COLOR2=$LIGHT_OFF_COLOR
fi

echo "%{F$COLOR1}%{A1:hue-toggle 1:}$LIGHT_ICON%{A}%{F-} %{F$COLOR2}%{A1:hue-toggle 2:}$LIGHT_ICON%{A}%{F-}"
