#!/bin/zsh

# Full path to the selected theme folder
THEME_DIR="$1"
if [ -z "$THEME_DIR" ] || [ ! -d "$THEME_DIR" ]; then
    echo "Error: Theme folder not found!"
    exit 1
fi

THEME_NAME=$(basename "$THEME_DIR")

copy_with_overwrite() {
    local src_dir="$1"
    local dest_dir="$2"

    if [ -d "$src_dir" ]; then
        mkdir -p "$dest_dir"
        for file in "$src_dir"/*; do
            [ -f "$file" ] && cp "$file" "$dest_dir/"
        done
    fi
}

# Copy configs for various apps
copy_with_overwrite "$THEME_DIR/hypr" "$HOME/.config/hypr"
copy_with_overwrite "$THEME_DIR/waybar" "$HOME/.config/waybar"
copy_with_overwrite "$THEME_DIR/kitty" "$HOME/.config/kitty"
copy_with_overwrite "$THEME_DIR/rofi" "$HOME/.config/rofi"

# Copy Fastfetch ascii.txt
if [ -f "$THEME_DIR/ascii.txt" ]; then
    mkdir -p "$HOME/.config/fastfetch"
    cp "$THEME_DIR/ascii.txt" "$HOME/.config/fastfetch/ascii.txt"
fi

# Copy ascii art for snacks.nvim (WebP only)
# if [ -f "$THEME_DIR/snacks-ascii.webp" ]; then
#     cp "$THEME_DIR/snacks-ascii.webp" "$HOME/.config/colorschemes/current-ascii-nvim.webp"
# fi

# Set wallpaper with swww
if command -v swww &> /dev/null; then
    WALLPAPER=""
    [ -f "$THEME_DIR/wallpaper.jpg" ] && WALLPAPER="$THEME_DIR/wallpaper.jpg"
    [ -f "$THEME_DIR/wallpaper.png" ] && WALLPAPER="$THEME_DIR/wallpaper.png"

    if [ -n "$WALLPAPER" ]; then
        swww img "$WALLPAPER" --transition-type fade --transition-duration 3
    fi
fi

# Reload Hyprland and Waybar
hyprctl reload
killall waybar && waybar &

notify-send "Theme Switched" "Applied theme: $THEME_NAME"
