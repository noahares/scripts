#!/bin/sh

default="${1%.*}.pdf"
if [[ ! -z $2 ]]; then
    [ ! -d $2 ] && mkdir $2
    file="${1##*/}"
    output="$2/${file%%.*}.pdf"
else
    output=$default
fi
pandoc "$1" \
    -f gfm \
    --include-in-header ~/repos/scripts/resources/inline_code.tex \
    --include-in-header ~/repos/scripts/resources/bullet_style.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=1.5cm \
   --pdf-engine=xelatex \
    --highlight-style ~/repos/scripts/resources/custom.theme \
    -f markdown+escaped_line_breaks \
    -o "$output"
