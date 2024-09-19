#!/usr/bin/bash

zscroll -l 30 -b "♪ " --delay 3 \
	--match-command "playerctl -p spotify status" \
	--match-text "Playing" "--before-text ' '" \
	--match-text "Paused" "--before-text ' ' --scroll 0" \
	--update-check true "playerctl -p spotify metadata --format \"{{ artist }} - {{ title }}\""

