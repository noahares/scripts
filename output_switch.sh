#!/bin/sh

if pactl list sinks | grep 'Active Port' | grep -q headphones; then
  pactl set-sink-port 0 analog-output-lineout
else
  pactl set-sink-port 0 analog-output-headphones
fi
