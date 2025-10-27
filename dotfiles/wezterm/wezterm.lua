local wezterm = require 'wezterm'

local config = {}

config.window_decorations = "NONE"
config.enable_tab_bar = false
config.window_background_opacity = 0.95
config.text_background_opacity = 1.0
config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "FiraCode Nerd Font" })
config.font_size = 12.0
config.window_padding = { left=6, right=6, top=4, bottom=4 }
config.enable_wayland = true
config.animation_fps = 120
config.max_fps = 120

local theme = require("theme")
config.color_scheme = theme.color_scheme

return config
