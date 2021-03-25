#!/bin/sh

toggle=$1
if [[ $toggle == 1 ]]; then
  echo "0.0.0.0  www.youtube.com" | sudo -A tee -a /etc/hosts
  focus_mode_bar.sh &
else
  sudo -S sed -i '/.*youtube.*/d' /etc/hosts
  launch_polybar.sh &
fi
