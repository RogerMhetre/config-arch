#!/bin/bash

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"

FILE="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

grim -g "$(slurp)" "$FILE"
wl-copy < "$FILE"

ACTION=$(dunstify \
    -A rename,Rename \
    " Area Screenshot Saved" \
    "$(basename "$FILE")")

if [ "$ACTION" = "2" ]; then
    NEWNAME=$(echo "" | wofi --dmenu -p "Rename Screenshot:")

    if [ -n "$NEWNAME" ]; then
        mv "$FILE" "$DIR/$NEWNAME.png"
        dunstify " Screenshot Renamed" "$NEWNAME.png"
    fi
fi



