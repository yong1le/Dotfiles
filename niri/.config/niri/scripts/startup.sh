#!/bin/bash

niri msg action focus-monitor-left
sleep 1
gtk-launch dev.vencord.Vesktop.desktop

sleep 1

niri msg action focus-workspace 2
gtk-launch org.mozilla.firefox.desktop

~/.config/waybar/scripts/niri-workspaces.sh DP-2
~/.config/waybar/scripts/niri-workspaces.sh eDP-1
