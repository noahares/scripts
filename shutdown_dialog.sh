#!/bin/sh

CHOICE=$(echo -e "shutdown\nreboot\nlock\nlogout" | rofi -dmenu -p "Power menu")

case $CHOICE in
    shutdown)
        shutdown now
        ;;
    reboot)
        reboot
        ;;
    lock)
        $HOME/.config/i3/scripts/lock.sh $HOME/pictures/icons/lock.png
        ;;
    logout)
        bspc quit
        ;;
esac
