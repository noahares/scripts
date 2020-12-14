#!/bin/bash

PLAYLIST_DIR="$(xdg-user-dir MUSIC)/playlists"

mpc clear
mpc lsplaylists | dmenu -i -fn "Anonymous Pro-10:normal" -dim "0.6" -x 20 -y 20 -w 1880 | xargs -I {} mpc load {}

mpc random on
mpc repeat on
mpc play
