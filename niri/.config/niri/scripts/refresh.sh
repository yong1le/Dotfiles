#!/usr/bin/env bash

killall waybar
killall swaync
killall avizo-service
killall walker

waybar &
swaync &
avizo-service &
walker --gapplication-service &
