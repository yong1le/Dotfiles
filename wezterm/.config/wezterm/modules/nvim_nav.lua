local wezterm = require "wezterm"
local act = wezterm.action

local function is_inside_vim(pane)
  local tty = pane:get_tty_name()
  if tty == nil then return false end

  local success, _, _ = wezterm.run_child_process {
    "sh",
    "-c",
    "ps -o state= -o comm= -t"
      .. wezterm.shell_quote_arg(tty)
      .. " | "
      .. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
  }

  return success
end

local function is_outside_vim(pane) return not is_inside_vim(pane) end

local function bind_if(cond, key, mods, action)
  local function callback(win, pane)
    if cond(pane) then
      win:perform_action(action, pane)
    else
      win:perform_action(act.SendKey { key = key, mods = mods }, pane)
    end
  end

  return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

return {
  is_outside_vim = is_outside_vim,
  bind_if = bind_if,
}
