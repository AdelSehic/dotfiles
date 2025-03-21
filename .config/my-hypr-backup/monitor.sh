#!/bin/bash

target="$HOME/.config/hypr/conf.d/monitor.conf"
dual="$HOME/.config/hypr/conf.d/monitor_dual.conf"
mirror="$HOME/.config/hypr/conf.d/monitor_mirror.conf"

monconf=$(readlink "$target")
if [[ $monconf == $dual ]] then
	ln -sf $mirror $target
else
	ln -sf $dual $target
fi

hyprctl reload
