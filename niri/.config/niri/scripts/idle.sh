#!/bin/bash

swayidle -w \
  timeout 250 'brightnessctl -s set 1' \
  resume 'brightnessctl -r' \
  timeout 300 'swaylock -f' \
  timeout 380 'niri msg action power-off-monitors' \
  before-sleep 'swaylock -f && loginctl lock-session' \
  timeout 600 'systemctl suspend'
