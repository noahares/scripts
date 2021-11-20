#!/bin/sh
CURRBRIGHT=$(xrandr --current --verbose | grep -m 1 'Brightness:' | cut -f2- -d:)
if [ "$1" = "+" ] && [ $(echo "$CURRBRIGHT < 1" | bc) -eq 1 ]
then
NEWBRIGHTNESS=$(echo "$CURRBRIGHT + 0.1" | bc)
echo $NEWBRIGHTNESS > $XDG_DATA_HOME/brightness
xrandr --output eDP1 --brightness $NEWBRIGHTNESS
elif [ "$1" = "-" ] && [ $(echo "$CURRBRIGHT > 0" | bc) -eq 1 ]
then
NEWBRIGHTNESS=$(echo "$CURRBRIGHT - 0.1" | bc)
echo $NEWBRIGHTNESS > $XDG_DATA_HOME/brightness
xrandr --output eDP1 --brightness $NEWBRIGHTNESS
fi
