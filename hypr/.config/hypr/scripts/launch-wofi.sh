#!/bin/env bash

if pgrep -x "wofi" > /dev/null; then
  pkill -9 wofi
else
  wofi -i --show drun --allow-images -D key_expand=Tab & 
fi
