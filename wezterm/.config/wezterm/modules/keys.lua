local wezterm = require "wezterm"
local act = wezterm.action

local nvim_nav = require "modules.nvim_nav"
local is_outside_vim = nvim_nav.is_outside_vim
local bind_if = nvim_nav.bind_if

local modules = {}

function modules.apply_to_config(config)
  config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 }
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = false

  config.keys = {
    bind_if(is_outside_vim, "h", "CTRL", act.ActivatePaneDirection "Left"),
    bind_if(is_outside_vim, "l", "CTRL", act.ActivatePaneDirection "Right"),
    bind_if(is_outside_vim, "j", "CTRL", act.ActivatePaneDirection "Down"),
    bind_if(is_outside_vim, "k", "CTRL", act.ActivatePaneDirection "Up"),
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
    {
      key = "h",
      mods = "LEADER",
      action = act.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
      key = "v",
      mods = "LEADER",
      action = act.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
      key = "w",
      mods = "LEADER",
      action = wezterm.action.CloseCurrentPane { confirm = false },
    },
    {
      key = "w",
      mods = "LEADER | SHIFT",
      action = wezterm.action.CloseCurrentTab { confirm = false },
    },
    {
      key = "t",
      mods = "LEADER",
      action = act.SpawnTab "CurrentPaneDomain",
    },
    {
      key = "n",
      mods = "LEADER",
      action = act.ActivateTabRelative(1),
    },
    {
      key = "p",
      mods = "LEADER",
      action = act.ActivateTabRelative(-1),
    },
  }
end

return modules
