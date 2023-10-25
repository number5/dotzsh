-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "Dracula+"

config.font_size = 19.0

config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Term Slab", stretch = "Expanded", weight = "ExtraLight" },
	"JetBrains Mono",
	"Noto Color Emoji",
})

config.scrollback_lines = 200000
config.tab_max_width = 24
config.use_dead_keys = false
config.window_decorations = "RESIZE" -- no title bar
config.window_background_opacity = 0.95
-- and finally, return the configuration to wezterm
return config
