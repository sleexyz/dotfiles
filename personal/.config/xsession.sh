#!/bin/sh


nitrogen --restore &
xset r rate 200 40
xset m 100/1 1
if xrandr | grep "DP1 connected"; then
  sh ~/.screenlayout/default.sh
fi
sleep 2 && compton -b &
