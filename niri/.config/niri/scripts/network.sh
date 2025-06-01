#/bin/bash

NETWORK="$1"

if [ -z "$NETWORK" ]; then
    echo "No network specified"
    exit 1
fi

# Connect to the network with password prompt
nmcli dev wifi connect "$NETWORK" --ask

# Keep terminal open for a moment to show result
read -p "Press Enter to close..."
