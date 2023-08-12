local wezterm = require "wezterm"

local modules = {}

function modules.apply_to_config(config)
  config.launch_menu = {
    {
      label = "Open Htop",
      args = { "htop" },
    },
  }
end

return modules
