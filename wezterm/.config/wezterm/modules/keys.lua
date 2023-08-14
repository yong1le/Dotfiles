local wezterm = require "wezterm"
local act = wezterm.action

local modules = {}

function modules.apply_to_config(config)
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = false

  config.keys = {
    {
      key = "h",
      mods = "CMD",
      action = act.DisableDefaultAssignment,
    },
    {
      key = "w",
      mods = "CMD",
      action = act.CloseCurrentPane { confirm = true },
    },
    {
      key = "w",
      mods = "CMD|SHIFT",
      action = act.CloseCurrentTab { confirm = true },
    },

    -- Pane/Tab Creation
    {
      key = "t",
      mods = "CMD",
      action = act.SpawnCommandInNewTab {
        cwd = "$HOME",
      },
    },
    {
      key = "t",
      mods = "CMD|SHIFT",
      action = act.ShowLauncher,
    },
    {
      key = "Enter",
      mods = "CMD",
      action = act.SplitHorizontal {
        domain = "CurrentPaneDomain",
      },
    },
    {
      key = "Enter",
      mods = "CMD|SHIFT",
      action = act.SplitVertical {
        domain = "CurrentPaneDomain",
      },
    },
    -- Split Window Movement
    {
      key = "a",
      mods = "CMD",
      action = act.TogglePaneZoomState,
    },
    {
      key = "s",
      mods = "CMD",
      action = act.PaneSelect {
        mode = "Activate",
      },
    },
    {
      key = "s",
      mods = "CMD|SHIFT",
      action = act.PaneSelect {
        mode = "SwapWithActive",
      },
    },
    {
      key = "h",
      mods = "CMD",
      action = act.ActivatePaneDirection "Left",
    },
    {
      key = "l",
      mods = "CMD",
      action = act.ActivatePaneDirection "Right",
    },
    {
      key = "j",
      mods = "CMD",
      action = act.ActivatePaneDirection "Down",
    },
    {
      key = "k",
      mods = "CMD",
      action = act.ActivatePaneDirection "Up",
    },
    {
      key = "h",
      mods = "CMD|SHIFT",
      action = act.AdjustPaneSize { "Left", 1 },
    },
    {
      key = "l",
      mods = "CMD|SHIFT",
      action = act.AdjustPaneSize { "Right", 1 },
    },
    {
      key = "k",
      mods = "CMD|SHIFT",
      action = act.AdjustPaneSize { "Up", 1 },
    },
    {
      key = "j",
      mods = "CMD|SHIFT",
      action = act.AdjustPaneSize { "Down", 1 },
    },
  }
end

return modules
