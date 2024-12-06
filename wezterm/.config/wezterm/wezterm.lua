-- Pull in the wezterm API
local wezterm = require "wezterm"
local keys = require "modules.keys"

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

-- Theming
config.color_scheme = "Kanagawa Dragon (Gogh)"
-- Fonts
config.font = wezterm.font_with_fallback { "SF Mono", { family = "Symbols Nerd Font Mono", scale = 0.75 } }
config.font_size = 10

-- Size
config.initial_rows = 40
config.initial_cols = 100

-- Keys
config.disable_default_key_bindings = true
keys.apply_to_config(config)

-- Menu bar
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

-- Padding
config.window_padding = {
  left = 5,
  right = 0,
  top = 5,
  bottom = 5,
}

-- options
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "SteadyBar"
config.warn_about_missing_glyphs = false

return config
