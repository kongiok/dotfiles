local utils = require 'utils'
local wezterm = require 'wezterm'
---@module 'terminal'
-- Configuration for terminals
local M = {
  -- I'll update it for sure.
  check_for_updates = false,
  -- font size
  adjust_window_size_when_changing_font_size = true,
  -- Input method
  use_ime = true,
  ime_preedit_rendering = "Builtin",
  -- keys
  use_dead_keys = false,
  warn_about_missing_glyphs = false,
  -- animations
  animation_fps = 10,
  visual_bell = {
    fade_in_function = 'Linear',
    fade_in_duration_ms = 150,
    fade_out_function = 'Linear',
    fade_out_duration_ms = 150,
  },
  cursor_blink_ease_out = "EaseInOut",
  cursor_blink_ease_in = "EaseInOut",
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 800,
  -- beep
  audible_bell = "SystemBeep",
  color_scheme = 'Catppuccin Mocha',
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  -- customization for different system
  enable_wayland = false,
  native_macos_fullscreen_mode = false,
  -- default program
  -- default_prog = { '' }
}


-- color scheme change
-- local current_appearance = wezterm.gui.get_appearance()
-- if current_appearance == ("Light" or "LightHighContrast")
-- then
--   M.color_scheme = "Catppuccin Latte"
-- else
--   M.color_scheme = "Catppuccin Mocha"
-- end

-- customization of macOS
if utils.get_current_os() == "DARWIN" then
  M.native_macos_fullscreen_mode = true
end

-- customization of linux
if utils.get_current_os() == "LINUX" then
  local current_session_type = os.getenv("XDG_SESSION_TYPE")
  if current_session_type == "wayland" then
    M.enable_wayland = true
  end
  M.enable_wayland = false
end

return M
