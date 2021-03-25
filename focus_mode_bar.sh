#!/bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pidof polybar >/dev/null; do sleep 1; done

if [[ $(polybar -m | wc -l) > 1 ]]; then
  M1=$(polybar -m | awk -F: 'NR==1{print $1}')
  M2=$(polybar -m | awk -F: 'NR==2{print $1}')
  MONITOR=$M1 polybar -rq wm &
  MONITOR=$M2 polybar -rq wm &
  MONITOR=$M2 polybar -rq media &
  MONITOR=$M1 polybar -rq state-focus &
  MONITOR=$M2 polybar -rq state-focus &
else
  M1=$(polybar -m | awk -F: 'NR==1{print $1}')
  MONITOR=$M1 polybar -rq wm &
  MONITOR=$M1 polybar -rq media &
  MONITOR=$M1 polybar -rq state-focus &
fi
