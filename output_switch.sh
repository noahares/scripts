#!/bin/bash

#cur_sink=$(pacmd list-sinks | grep '* index:' | tr -d '\n' | tail -c 1)
new_sink=$(pacmd list-sinks | grep 'index:' | grep -v '*' | tr -d '\n' | tail -c 2)

pacmd set-default-sink $new_sink

pacmd list-sink-inputs | grep index | while read line
do
        pacmd move-sink-input `echo $line | cut -f2 -d ' '` $new_sink
done

polybar-msg hook audio_out 1
