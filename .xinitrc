#!/bin/sh
# compton -b &
# nitrogen --restore &
xrdb ~/.Xresources

# speed up key repeat speed and shorten initialization delay
xset r rate 200 40 

# Disable tap to click
synclient TapButton1=0

# exec xmonad

exec i3
