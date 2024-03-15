local wezterm = require "wezterm"
local act = wezterm.action

local modules = {}

function modules.apply_to_config(config)
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = false

  config.keys = {
    {
      key = "Enter",
      mods = "ALT",
      action = act.DisableDefaultAssignment,
    },
    {
      key = "Tab",
      mods = "CTRL",
      action = act.DisableDefaultAssignment,
    },
    {
      key = "Tab",
      mods = "CTRL|SHIFT",
      action = act.DisableDefaultAssignment,
    },
  }
end

return modules
