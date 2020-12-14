#!/bin/bash

bgloc="$HOME/pictures/wallpapers/bg.jpg"

[ -f "$1" ] && cp "$1" "$bgloc" && notify-send -i "$bgloc" "Changing wallpaper..."

wal -c
wal -n -i "$bgloc"

xwallpaper --zoom "$bgloc"
