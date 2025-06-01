#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
DEST_DIR="$HOME/.local/share/niri-wallpaper"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

wallpaper=$(zenity --file-selection \
  --title="Choose a Wallpaper" \
  --file-filter="Images | *.png *.jpg *.jpeg" \
  --filename="$WALLPAPER_DIR")

# Check if a wallpaper was selected
if [ -n "$wallpaper" ]; then
  echo "Selected wallpaper: $wallpaper"

  extension="${wallpaper##*.}"
  if [[ "$extension" == "jpg" || "$extension" == "jpeg" ]]; then
    extension="mjpeg"
  elif [[ "$extension" == "png" ]]; then
    extension="apng"
  fi

  # Copy the selected wallpaper to current
  cp "$wallpaper" "$DEST_DIR/current"

  # Create a blurred version using ffmpeg
  ffmpeg -i "$wallpaper" -vf "gblur=sigma=50" -f "$extension" -y "$DEST_DIR/current-blur"

  swww img ~/.local/share/niri-wallpaper/current
  swaybg -m fill -i ~/.local/share/niri-wallpaper/current-blur &
  disown
else
  echo "No wallpaper selected"
fi
