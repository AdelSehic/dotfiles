#!/bin/bash

theme=$2

config_dir="$HOME/.config/hypr/conf.d/monitor-confs"
icons_dir="$HOME/.config/hypr/conf.d/monitor-confs/icons"
symlink="$HOME/.config/hypr/conf.d/monitor.conf"

# files=$(ls "$config_dir")
mapfile -t files < <(ls $config_dir/*.conf)

titles=()
for f in "${files[@]}"; do
	titles+=("$(head -n 1 "$f")")
done

display=()
for i in "${!titles[@]}"; do
	title="${titles[i]}"
	filename=$(basename ${files[i]})
	icon_line=$(head -n 2 ${files[i]} | tail -n 1)
	icon=${icon_line:1}
	display+="${title:1} ($filename)\0icon\x1f$icons_dir/$icon"$'\n'
done

selected=$(echo -en "$display" | rofi -dmenu -theme $2)

[ -z "$selected" ] && exit 1

file=$(echo "$selected" | grep -oP '\(\K[^\)]+')
config="$config_dir/$file"

[ -L "$symlink" ] && rm "$symlink"
ln -s "$config" "$symlink"

hyprctl reload
