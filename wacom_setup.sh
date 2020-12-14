#! /bin/sh

screen=${1:-0}
stylus="$(xsetwacom list devices | grep stylus | cut -f2 | cut -d' ' -f2)"
pad="$(xsetwacom list devices | grep pad | cut -f2 | cut -d' ' -f2)"
if [[ $(hostname) == 'arch' ]]; then
    xsetwacom set $stylus MapToOutput DisplayPort-$screen
fi
xsetwacom set $pad Button 1 5
xsetwacom set $pad Button 2 4
