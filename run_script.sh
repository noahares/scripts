#!/bin/sh

script=$(ls $HOME/repos/scripts | rofi -dmenu run -p "Run script")
$script
