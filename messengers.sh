#!/bin/sh

notify-send "Starting Messengers..."
# setsid -f telegram-desktop -startintray
setsid -f signal-desktop --start-in-tray
setsid -f zulip
setsid -f slack -u
