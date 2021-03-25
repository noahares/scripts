#!/bin/sh

dmenu -mask -p "$1" <&- && echo
