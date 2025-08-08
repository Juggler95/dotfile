#!/usr/bin/env bash

TMP_FILE="$XDG_RUNTIME_DIR/hyprland-show-desktop"
CURRENT_WORKSPACE=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.name')

if [ -s "$TMP_FILE-$CURRENT_WORKSPACE" ]; then
  readarray -t ADDRESS_ARRAY < "$TMP_FILE-$CURRENT_WORKSPACE"

  CMDS=""
  for address in "${ADDRESS_ARRAY[@]}"; do
    CMDS+="dispatch movetoworkspacesilent name:$CURRENT_WORKSPACE,address:$address;"
  done

  hyprctl --batch "$CMDS"
  rm "$TMP_FILE-$CURRENT_WORKSPACE"
else
  HIDDEN_WINDOWS=$(hyprctl clients -j | jq -r --arg CW "$CURRENT_WORKSPACE" '.[] | select(.workspace.name == $CW) | .address')

  readarray -t ADDRESS_ARRAY <<< "$HIDDEN_WINDOWS"

  CMDS=""
  TMP_ADDRESS=""
  for address in "${ADDRESS_ARRAY[@]}"; do
    if [ -n "$address" ]; then
      TMP_ADDRESS+="$address\n"
      CMDS+="dispatch movetoworkspacesilent special:desktop,address:$address;"
    fi
  done

  hyprctl --batch "$CMDS"
  echo -e "$TMP_ADDRESS" | sed '/^$/d' > "$TMP_FILE-$CURRENT_WORKSPACE"
fi
