#!/bin/sh

notify-send "Starting Messengers..."
# setsid -f telegram-desktop -startintray
pgrep -f signal-desktop &> /dev/null || setsid -f signal-desktop --start-in-tray &>/dev/null
pgrep -f zulip &> /dev/null || setsid -f zulip &>/dev/null
pgrep -f slack &> /dev/null || setsid -f slack -u &>/dev/null
