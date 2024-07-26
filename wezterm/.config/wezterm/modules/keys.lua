local wezterm = require "wezterm"
local act = wezterm.action

local modules = {}

function modules.apply_to_config(config)
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = false

  config.keys = {
    {
      key = "c",
      mods = "CTRL|SHIFT",
      action = act.CopyTo "Clipboard",
    },
    {
      key = "v",
      mods = "CTRL|SHIFT",
      action = act.PasteFrom "Clipboard",
    },
  }
end

return modules
