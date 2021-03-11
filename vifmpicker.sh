tmpfile=/tmp/vifmpick
if \[ -z "$1" \]; then
   vifm --choose-files $tmpfile && echo "$(awk 'BEGIN {printf "%s", "push "} {printf "%s", "<attach-file>"$0"<enter>"}'  $tmpfile)" > $tmpfile
elif \[ $1 == "clean" \]; then
  rm $tmpfile
fi
