-- Pull in the wezterm API
local wezterm = require "wezterm"
local keys = require "modules.keys"

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

-- Theming
config.color_scheme = "Gruvbox Dark (Gogh)"

-- Fonts
config.font = wezterm.font "JetBrainsMono Nerd Font"
config.font_size = 12

-- Size
config.initial_rows = 40
config.initial_cols = 100

-- Keys
config.disable_default_key_bindings = true
keys.apply_to_config(config)

-- Menu bar
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 20,
  bottom = 0,
}

-- options
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "SteadyBar"

-- Mux
config.unix_domains = {
  {
    name = "unix",
  },
}

return config
