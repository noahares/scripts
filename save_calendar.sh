#!/bin/sh

if [[ -f $1 ]]; then
    resp=$(echo -e "yes\nno" | rofi -i -only-match -dmenu -p "Would you like to add the event:" -mesg "`khal printics $1 | tail -n +2`")

    if [[ "$resp" == "yes" ]]; then
        calendar=$(echo "`khal printcalendars`" | rofi -i -only-match -dmenu -p "Save to:")
        if [ -z "$calendar" ]; then
            exit;
        fi
        khal import -a "$calendar" --batch $1 && \
            dunstify "Calendar" "Even added";
    fi
fi
