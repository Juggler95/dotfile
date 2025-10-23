#!/bin/zsh

THEME_DIR="$HOME/.config/colorschemes"
SCRIPT_PATH="$THEME_DIR/theme-loader.sh"

# List theme folders
THEMES=$(for dir in "$THEME_DIR"/*/; do basename "$dir"; done | sort)

# Show Wofi dmenu for theme selection
CHOSEN=$(echo "$THEMES" | rofi -i -dmenu -p "Choose Theme")

# Apply theme if selected
if [ -n "$CHOSEN" ]; then
    "$SCRIPT_PATH" "$THEME_DIR/$CHOSEN"
fi
