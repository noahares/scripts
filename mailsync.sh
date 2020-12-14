#!/bin/bash

notify-send "Fetching Mail..."
if [ -z "$1" ]; then
    mbsync -a
else
    mbsync "$1"
fi
notmuch new 2>/dev/null
notify-send "Done fetching Mail."
#pkill -SIGRTMIN i3blocks
polybar-msg hook mail 1
