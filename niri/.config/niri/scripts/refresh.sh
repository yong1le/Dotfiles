#!/usr/bin/env bash

killall waybar
killall swaync
killall swayosd-server

waybar &
swaync &
swayosd-server &
