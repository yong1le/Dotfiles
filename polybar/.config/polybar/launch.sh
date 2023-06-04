#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bars on multiple displays
for m in $(polybar -M | cut -d ':' -f 1); do
    MONITOR=$m polybar --reload fall &
done

echo "Bars launched..."
