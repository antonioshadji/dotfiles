#!/usr/bin/env bash

TARGET_DIR="$HOME/Pictures/$(date +%Y/%m)"
mkdir -p "$TARGET_DIR"

SOUND="/usr/share/sounds/freedesktop/stereo/camera-shutter.oga"
FILENAME_DATE=$(date +%dT%H-%M-%S)

case "$1" in
  full)
    grim -o HDMI-A-1 "$TARGET_DIR/$FILENAME_DATE.png" && paplay "$SOUND"
    ;;
  region)
    grim -g "$(slurp)" "$TARGET_DIR/$FILENAME_DATE.png" && paplay "$SOUND"
    ;;
  window)
    GEOM=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
    grim -g "$GEOM" "$TARGET_DIR/$FILENAME_DATE.png" && paplay "$SOUND"
    ;;
  *)
    echo "Usage: $0 {full|region|window}"
    exit 1
    ;;
esac
