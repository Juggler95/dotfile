#!/bin/bash

player="spotify"
status=$(playerctl --player="$player" status 2>/dev/null)

# Function to get song info
get_metadata() {
    playerctl --player="$player" metadata --format "{{ artist }} - {{ title }}" 2>/dev/null
}

# Function to trim text if it's too long
trim_text() {
    local text="$1"
    local max_length=30  # change this to however many characters you want
    if (( ${#text} > max_length )); then
        echo "${text:0:max_length}…"
    else
        echo "$text"
    fi
}

if [[ -z "$status" ]]; then
    echo '{"text": "No player", "class": "no-player"}'
elif [[ "$status" == "Playing" ]]; then
    metadata=$(trim_text "$(get_metadata)")
    echo "{\"text\": \"$metadata\", \"class\": \"playing\", \"tooltip\": \"$(get_metadata)\", \"on-click\": \"playerctl --player=$player play-pause\"}"
else
    metadata=$(trim_text "$(get_metadata)")
    echo "{\"text\": \"$metadata\", \"class\": \"paused\", \"tooltip\": \"$(get_metadata)\", \"on-click\": \"playerctl --player=$player play-pause\"}"
fi

