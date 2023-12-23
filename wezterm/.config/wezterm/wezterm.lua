-- Pull in the wezterm API
local wezterm = require "wezterm"
local kanagawa = require "colors.kanagawa"
local keys = require "modules.keys"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- Theming
config.colors = kanagawa.colors()
config.window_frame = kanagawa.window_frame()

-- Fonts
config.font = wezterm.font "IosevkaTerm Nerd Font Mono"
config.font_size = 17

-- Keys
keys.apply_to_config(config)

-- Menu bar
config.window_decorations = "INTEGRATED_BUTTONS"
config.enable_tab_bar = false

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 30,
  bottom = 0
}

return config
