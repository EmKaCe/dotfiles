#!/bin/bash

# Check if Spotify player is running
if ! playerctl -p spotify status &> /dev/null; then
    exit 1
elif [ "$(playerctl -p spotify status)" = "Paused" ]; then
    printf " %s  %s" "$(playerctl -p spotify metadata artist)" "$(playerctl -p spotify metadata title)"
elif [ "$(playerctl -p spotify status)" = "Playing" ]; then
    printf " %s  %s" "$(playerctl -p spotify metadata artist)" "$(playerctl -p spotify metadata title)"
elif [ "$(playerctl -p spotify status)" = "Stopped" ]; then
    printf " %s  %s" "$(playerctl -p spotify metadata artist)" "$(playerctl -p spotify metadata title)"
fi
