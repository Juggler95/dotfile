#!/bin/bash

player="spotify"
status=$(playerctl --player="$player" status 2>/dev/null)

get_metadata() {
    playerctl --player="$player" metadata --format "{{ artist }} - {{ title }}" 2>/dev/null
}

trim_text() {
    local text="$1"
    local max_length=30
    if (( ${#text} > max_length )); then
        echo "${text:0:max_length}…"
    else
        echo "$text"
    fi
}

get_repeat_icon() {
    local loop_status
    loop_status=$(playerctl --player="$player" loop 2>/dev/null)
    if [[ "$loop_status" == "Track" ]]; then
        echo "  "   # repeat single track icon
    else
        echo ""
    fi
}

if [[ -z "$status" ]]; then
    echo '{"text": "No player", "class": "no-player"}'
elif [[ "$status" == "Playing" ]]; then
    metadata=$(trim_text "$(get_metadata)")
    repeat_icon=$(get_repeat_icon)
    echo "{\"text\": \"$metadata$repeat_icon\", \"class\": \"playing\", \"tooltip\": \"$(get_metadata)\", \"on-click\": \"playerctl --player=$player play-pause\"}"
else
    metadata=$(trim_text "$(get_metadata)")
    repeat_icon=$(get_repeat_icon)
    echo "{\"text\": \"$metadata$repeat_icon\", \"class\": \"paused\", \"tooltip\": \"$(get_metadata)\", \"on-click\": \"playerctl --player=$player play-pause\"}"
fi
