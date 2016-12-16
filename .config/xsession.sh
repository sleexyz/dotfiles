# compton -b &
nitrogen --restore &
xset r rate 200 40
xset m 100/1 1
if xrandr | grep "DP-3 connected"; then
  ~/.screenlayout/work.sh
  echo "power on" | bluetoothctl
  sleep 5
  echo "connect 1C:1A:C0:F2:B7:8F" | bluetoothctl
  sleep 5
  xinput --set-prop "Alex Horovitz’s Trackpad" "Device Accel Velocity Scaling" 40
fi
