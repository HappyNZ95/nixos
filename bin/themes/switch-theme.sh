#/usr/bin/env bash

#usage: ./switch-theme.sh <theme-name>
#example: ./switch-theme.sh nord

THEME="$1"
BASE_DIR="$HOME/nixos/themes"
CURRENT="$BASE_DIR/current/theme"
DOTFILES="$HOME/nixos/dotfiles"

set -e 

#Helper function
link_or_copy(){
    local src="$1"
    local dest="$2"
    local method="${3:-ln}"

    if [ "$method" = "ln" ]; then
        ln -sf "$src" "$dest"
    elif [ "$method" = "cp" ]; then
        cp --remove-destination "$src" "$dest"
    fi
}

# ----------------------
# WezTerm
# ----------------------
link_or_copy "$BASE_DIR/$THEME/wezterm.lua" "$CURRENT/wezterm.lua"
link_or_copy "$CURRENT/wezterm.lua" "$DOTFILES/wezterm/theme.lua" cp

# ----------------------
# Sway / i3blocks
# ----------------------
link_or_copy "$BASE_DIR/$THEME/sway" "$CURRENT/sway"
link_or_copy "$BASE_DIR/$THEME/i3blocks" "$CURRENT/i3blocks"
swaymsg reload 2>/dev/null || echo "Sway not running"

# ----------------------
# Fuzzel
# ----------------------
link_or_copy "$BASE_DIR/$THEME/fuzzel.ini" "$CURRENT/fuzzel.ini"
link_or_copy "$CURRENT/fuzzel.ini" "$DOTFILES/fuzzel/fuzzel.ini" cp

# ----------------------
# Obsidian
# ----------------------
link_or_copy "$BASE_DIR/$THEME/obsidian.json" "$CURRENT/obsidian.json"
link_or_copy "$CURRENT/obsidian.json" "$HOME/sync-vault/.obsidian/appearance.json" cp

# Optional: Open Obsidian and reload
xdg-open "obsidian://adv-uri?vault=sync-vault&commandid=app%3Areload"

# ----------------------
# Neovim
# ----------------------
link_or_copy "$BASE_DIR/$THEME/neovim.lua" "$CURRENT/neovim.lua"

LUAFILE="$CURRENT/neovim.lua"
for sock in /run/user/1000/nvim.*.0; do
    if [ -S "$sock" ]; then
        nvim --server "$sock" --remote-send "<Esc>:luafile $LUAFILE<CR>"
        echo "🔄 Reloaded Neovim at $sock"
    fi
doneBASE_DIR/$THEME/wezterm.lua" "$CURRENT/wezterm.lua"
