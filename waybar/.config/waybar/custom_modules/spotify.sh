#!/usr/bin/bash

if pidof spotify> /dev/null; then
	playerctl -p spotify play-pause
else
	exec spotify
fi
