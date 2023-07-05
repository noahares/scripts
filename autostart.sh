#!/bin/sh

messengers.sh &
pgrep -f seafile-applet &> /dev/null || seafile-applet &
pgrep -f tablet_map_to_focus.py &> /dev/null || tablet_map_to_focus.py "wacom-intuos-s-pen"
