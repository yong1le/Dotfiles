#!/bin/bash

swayidle -w \
  timeout 250 'brightnessctl -s set 1' \
  resume 'brightnessctl -r' \
  timeout 300 '~/.config/niri/scripts/lock.sh' \
  timeout 380 '/usr/bin/niri msg action power-off-monitors' \
  resume '/usr/bin/niri msg action power-on-monitors' \
  before-sleep 'loginctl lock-session' \
  timeout 600 'systemctl suspend' \
  lock '~/.config/niri/scripts/lock.sh'
