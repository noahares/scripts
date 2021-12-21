#!/bin/sh

# Broken
set -o errexit
set -o pipefail

# if [ -z "$QUTE_FIFO" ] ; then
#     help
#     exit
# fi

tmp_file="/tmp/qute-vifm-chosen"

if test -f "$tmp_file"; then
    rm "$tmp_file"
fi

st -e vifm --choose-dir $tmp_file

if test -f "$tmp_file"; then
    chosen="$(cat "$tmp_file")"
    rm "$tmp_file"
    st -e "read -p \"File to save as? [d]efault/(o)verwrite/(n)ew: \" -N 1 choice; echo \"\$choice\" > \"$tmp_file\""
    choice="$(cat "$tmp_file")"
    rm "$tmp_file"
    case $choice in
        o)
            st -e "vifm --choose-file=\"$tmp_file\" --select=\"$chosen\""
            if test -f "$tmp_file"; then
                chosen="$(cat "$tmp_file")"
                rm "$tmp_file"
            fi
            ;;
        n)
            st -e "read -p \"Name: \" name; echo \"\$name\" > \"$tmp_file\""
            if test -f "$tmp_file"; then
                chosen="$chosen/$(cat "$tmp_file")"
                rm "$tmp_file"
            fi
            ;;
    esac
    # echo "download --dest \"$chosen\"" >> "$QUTE_FIFO"
    echo "$chosen"
fi
