local wezterm = require 'wezterm'
local act = wezterm.action
local M = {}

M.keys = {
  -- 舉例：按下 Leader + v 水平分割
  { key = 'v', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 's', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
}

return M
