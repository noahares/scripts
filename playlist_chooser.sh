#!/bin/sh

PLAYLIST_DIR="$(xdg-user-dir MUSIC)/playlists"

mpc clear
mpc lsplaylists | rofi -dmenu -p "Choose playlist" | xargs -I {} mpc load {}

mpc random on
mpc repeat on
mpc play
