#!/bin/bash

# Display dmenu with a placeholder
echo "Scanning..." | fuzzel -d &
pid="$!"

# Read the scan results
nmcli dev wifi rescan
wifis=$(nmcli --terse device wifi | cut -d: -f8 | sort | uniq | grep -v '^$')

if ! kill "$pid"; then
  exit
fi

# Update dmenu with the actual Wi-Fi list
if [[ -n "$wifis" ]]; then
  selected=$(echo "$wifis" | fuzzel -d)
fi

if ! nmcli connection up "$selected"; then
  wezterm start --class ags-wifi bash -c "nmcli dev wifi connect --ask \"$selected\""
fi
