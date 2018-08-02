#!/bin/sh


nitrogen --restore &
xset r rate 200 40
xset m 5/4 1
sleep 2 && compton -b &
