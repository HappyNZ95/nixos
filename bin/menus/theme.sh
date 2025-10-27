#!/usr/bin/env bash

# Theme selector script
# Lists themes from ~/nixos/themes, excludes 'current', and switches to selected theme

THEMES_DIR="$HOME/nixos/themes"
SWITCH_SCRIPT="$HOME/nixos/bin/switch-theme.sh"

# Check if themes directory exists
if [[ ! -d "$THEMES_DIR" ]]; then
    echo "Error: Themes directory not found: $THEMES_DIR" >&2
    exit 1
fi

# Check if switch script exists
if [[ ! -x "$SWITCH_SCRIPT" ]]; then
    echo "Error: Switch script not found or not executable: $SWITCH_SCRIPT" >&2
    exit 1
fi

# Get list of theme directories, excluding 'current'
selected_theme=$(find "$THEMES_DIR" -mindepth 1 -maxdepth 1 -type d ! -name current -printf '%f\n' | sort | fuzzel --dmenu)

# Exit if no selection was made
if [[ -z "$selected_theme" ]]; then
    echo "No theme selected" >&2
    exit 0
fi

# Execute the switch script with the selected theme
"$SWITCH_SCRIPT" "$selected_theme"
