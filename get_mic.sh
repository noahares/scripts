#!/bin/sh

amixer -D pulse get Capture | sed -n -e 's/\[on\]//;s/\[off\]//; $p' | rev | cut -d ' ' -f 1 | rev
