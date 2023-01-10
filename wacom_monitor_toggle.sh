#!/bin/sh

while true; do
  bspc subscribe monitor_focus | stdbuf -oL cut -d ' ' -f2 | xargs -L1 bspc query -M --names -m | xargs -I "{}" sh -c 'xsetwacom set $(xsetwacom list devices | grep stylus | cut -f2 | cut -d" " -f2) MapToOutput "{}"'
done
