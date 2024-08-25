#!/bin/bash

niri msg action focus-monitor-left
sleep 1
gtk-launch dev.vencord.Vesktop.desktop

sleep 1

~/.config/waybar/scripts/niri-workspaces.sh focus-workspace 2
flatpak run io.github.zen_browser.zen
