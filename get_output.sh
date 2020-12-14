#!/bin/bash

cur_sink=$(pacmd list-sinks | grep '* index:' | tr -d '\n' | tail -c 1)

case $cur_sink in
    7 )
        echo "monitor";;
    8 )
        echo "headset";;
    * )
        echo "headphones";;
esac
