#!/bin/zsh

THEME_NAME="$1"
THEME_DIR="$HOME/.config/colorschemes/$THEME_NAME"

copy_with_overwrite() {
  src_dir="$1"
  dest_dir="$2"

  if [ -d "$src_dir" ]; then
    mkdir -p "$dest_dir"
    for file in "$src_dir"/*; do
      filename=$(basename "$file")
      if [ -f "$file" ]; then
        cp "$file" "$dest_dir/$filename"
      fi
    done
  fi
}

# Copy configs for various apps
copy_with_overwrite "$THEME_DIR/hypr" "$HOME/.config/hypr"
copy_with_overwrite "$THEME_DIR/waybar" "$HOME/.config/waybar"
copy_with_overwrite "$THEME_DIR/kitty" "$HOME/.config/kitty"
copy_with_overwrite "$THEME_DIR/wofi" "$HOME/.config/wofi"

# Copy Fastfetch ascii.txt (if present)
if [ -f "$THEME_DIR/ascii.txt" ]; then
  mkdir -p "$HOME/.config/fastfetch"
  cp "$THEME_DIR/ascii.txt" "$HOME/.config/fastfetch/ascii.txt"
fi

# Set wallpaper with swww (supports .jpg and .png)
if command -v swww &> /dev/null; then
  if [ -f "$THEME_DIR/wallpaper.jpg" ]; then
    WALLPAPER="$THEME_DIR/wallpaper.jpg"
  elif [ -f "$THEME_DIR/wallpaper.png" ]; then
    WALLPAPER="$THEME_DIR/wallpaper.png"
  fi

  if [ -n "$WALLPAPER" ]; then
    swww img "$WALLPAPER" --transition-type wipe --transition-duration 2
  fi
fi

# Reload Hyprland and Waybar
hyprctl reload
killall waybar && waybar &

notify-send "Theme Switched" "Applied theme: $THEME_NAME"

