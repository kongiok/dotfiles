local wezterm = require 'wezterm'
local M = {}

function M.apply_to_config(config)
  wezterm.on('format-window-title', function(tab, pane, tabs, panes, config)
    return "Atlas | " .. tab.active_pane.title
  end)
end

return M
