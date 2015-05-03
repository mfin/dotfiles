#!/bin/bash

if [ -f $HOME/.dmenurc ]; then
	. $HOME/.dmenurc
else
	DMENU_RUN='dmenu_run -i'
fi

$DMENU_RUN