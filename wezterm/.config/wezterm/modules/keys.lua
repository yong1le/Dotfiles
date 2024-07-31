local wezterm = require "wezterm"
local act = wezterm.action

require "modules.nvim_nav"

local modules = {}

wezterm.on("update-right-status", function(window, pane) window:set_right_status(window:active_workspace()) end)

function modules.apply_to_config(config)
  config.leader = { key = " ", mods = "CTRL", timeout_milliseconds = 2000 }
  config.send_composed_key_when_left_alt_is_pressed = false
  config.send_composed_key_when_right_alt_is_pressed = false

  config.keys = {
    { key = "h", mods = "CTRL", action = act.EmitEvent "ActivatePaneDirection-left" },
    { key = "j", mods = "CTRL", action = act.EmitEvent "ActivatePaneDirection-down" },
    { key = "k", mods = "CTRL", action = act.EmitEvent "ActivatePaneDirection-up" },
    { key = "l", mods = "CTRL", action = act.EmitEvent "ActivatePaneDirection-right" },
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
    {
      key = " ",
      mods = "LEADER | CTRL",
      action = act.ShowLauncherArgs {
        flags = "FUZZY | WORKSPACES",
      },
    },
    {
      key = "n",
      mods = "LEADER | SHIFT",
      action = act.PromptInputLine {
        description = wezterm.format {
          { Attribute = { Intensity = "Bold" } },
          { Foreground = { AnsiColor = "Fuchsia" } },
          { Text = "Enter name for new workspace" },
        },
        action = wezterm.action_callback(function(window, pane, line)
          if line then
            window:perform_action(
              act.SwitchToWorkspace {
                name = line,
              },
              pane
            )
          end
        end),
      },
    },
  }
end

return modules
