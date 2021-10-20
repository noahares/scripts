#!/bin/sh

result="$(rga . --type pdf | fzf | cut -d ':' -f 1,2 | sed -e 's/Page //')"
if [[ ! -z $result ]]; then
    page=${result##*:}
    $VIEWER --fork "${result%:*}" --page="$page" & disown
fi
