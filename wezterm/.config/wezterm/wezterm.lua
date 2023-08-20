-- Pull in the wezterm API
local wezterm = require "wezterm"
local astrodark = require "colors.astrodark"
local launch_menu = require "modules.launch_menu"
local keys = require "modules.keys"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- Theming
config.colors = astrodark.colors()
config.window_frame = astrodark.window_frame()

-- Fonts
config.font = wezterm.font "IosevkaTerm Nerd Font Mono"
config.font_size = 17

-- Right clicking '+' button
launch_menu.apply_to_config(config)

-- Keys
keys.apply_to_config(config)

-- Menu bar
config.window_decorations = "INTEGRATED_BUTTONS"

return config
