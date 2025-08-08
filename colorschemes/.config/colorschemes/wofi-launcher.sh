#!/bin/zsh

THEME_DIR="$HOME/.config/colorschemes"
SCRIPT_PATH="$THEME_DIR/theme-loader.sh"

# Only list theme folders (exclude .sh and other files)
# THEMES=$(find "$THEME_DIR" -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | sort)
THEMES=$(for dir in "$THEME_DIR"/*/; do basename "$dir"; done | sort)

# Let user pick a theme
CHOSEN=$(echo "$THEMES" | wofi --dmenu --prompt "Choose Theme")

# Apply theme if selected
if [ -n "$CHOSEN" ]; then
  "$SCRIPT_PATH" "$CHOSEN"
fi
