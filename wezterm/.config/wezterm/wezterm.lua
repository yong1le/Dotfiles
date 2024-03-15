-- Pull in the wezterm API
local wezterm = require "wezterm"
local keys = require "modules.keys"

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then config = wezterm.config_builder() end

-- Theming
config.color_scheme = "Catppuccin Mocha"
-- config.colors = kanagawa.colors()
-- config.window_frame = kanagawa.window_frame()

-- Fonts
config.font = wezterm.font "SauceCodePro Nerd Font Mono"
config.font_size = 12

-- Size
config.initial_rows = 40
config.initial_cols = 100

-- Keys
keys.apply_to_config(config)

-- Menu bar
-- config.window_decorations = "INTEGRATED_BUTTONS"
config.enable_tab_bar = false
config.window_close_confirmation = 'NeverPrompt'

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 0,
  bottom = 0
}

return config
