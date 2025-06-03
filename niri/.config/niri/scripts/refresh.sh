#!/usr/bin/env bash

killall waybar
killall swaync
killall avizo-service
killall walker
killall wl-paste

waybar &
swaync &
avizo-service &
walker --gapplication-service &
