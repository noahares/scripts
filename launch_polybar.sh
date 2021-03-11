#!/bin/sh

BAR=""

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pidof polybar >/dev/null; do sleep 1; done

case $(hostname) in
  'arch' )
    BAR='desktop';;
  'arch2' )
    BAR='laptop';;
  default )
    BAR='laptop';;
esac

if [[ $(polybar -m | wc -l) > 1 ]]; then
  M1=$(polybar -m | awk -F: 'NR==1{print $1}')
  M2=$(polybar -m | awk -F: 'NR==2{print $1}')
  MONITOR=$M1 polybar -rq wm &
  MONITOR=$M2 polybar -rq wm &
  MONITOR=$M2 polybar -rq media &
  MONITOR=$M2 polybar -rq state &
  MONITOR=$M2 polybar -rq tray &
else
  M1=$(polybar -m | awk -F: 'NR==1{print $1}')
  MONITOR=$M1 polybar -rq wm &
  MONITOR=$M1 polybar -rq media &
  MONITOR=$M1 polybar -rq state &
  MONITOR=$M1 polybar -rq tray &
fi

#for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar $BAR & done
