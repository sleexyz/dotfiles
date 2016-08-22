# compton -b &
nitrogen --restore &
xset r rate 200 40
xset m 100/1 1
if xrandr | grep "DP-3 connected"; then
  ~/.screenlayout/work.sh
fi

bluetoothctl << EOF
connect 1C:1A:C0:F2:B7:8F
EOF && sleep 10 && xinput --set-prop "Alex Horovitz’s Trackpad" "Device Accel Velocity Scaling" 32xinput --set-prop "Alex Horovitz’s Trackpad" "Device Accel Velocity Scaling" 40
