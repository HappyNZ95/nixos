#!/usr/bin/env bash

#wezterm
ln -sf /home/htw/nixos/themes/ristretto/wezterm.lua /home/htw/nixos/themes/current/theme/wezterm.lua
cp --remove-destination /home/htw/nixos/themes/current/theme/wezterm.lua /home/htw/nixos/dotfiles/wezterm/theme.lua

# sway/i3blocks
ln -sf /home/htw/nixos/themes/ristretto/sway /home/htw/nixos/themes/current/theme/sway
ln -sf /home/htw/nixos/themes/ristretto/i3blocks /home/htw/nixos/themes/current/theme/i3blocks
#live reload sway/i3blocks
swaymsg reload

#obsidian
ln -sf /home/htw/nixos/themes/ristretto/obsidian.json /home/htw/nixos/themes/current/theme/obsidian.json
cp --remove-destination /home/htw/nixos/themes/current/theme/obsidian.json /home/htw/sync-vault/.obsidian/appearance.json

# Kill Obsidian immediately
pkill -9 -f "[o]bsidian"

# Launch Obsidian in workspace 3 without moving focus
swaymsg "exec obsidian"

# Launch Obsidian in workspace 3 without moving focus
swaymsg "exec obsidian"

#neovim
ln -sf /home/htw/nixos/themes/ristretto/neovim.lua /home/htw/nixos/themes/current/theme/neovim.lua
#live reload neovim
LUAFILE="/home/htw/nixos/themes/current/theme/neovim.lua"

for sock in /run/user/1000/nvim.*.0; do
    if [ -S "$sock" ]; then
        nvim --server "$sock" --remote-send "<Esc>:luafile $LUAFILE<CR>"
        echo "🔄 Reloaded Neovim at $sock"
    fi
done
