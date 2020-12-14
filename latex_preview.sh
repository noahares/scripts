#!/bin/sh

out=$(dirname "$1")/build

if [[ ! -d $out ]]; then
   latexmk -pdf -synctex=1 -output-directory=$out -lualatex $1
fi

zathura $out/*.pdf &
latexmk -pvc -pdf -synctex=1 -output-directory=$out -lualatex $1
