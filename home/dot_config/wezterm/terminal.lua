local utils = require 'utils'
local wezterm = require 'wezterm'
local gpus = wezterm.gui.enumerate_gpus()

--- @module 'terminal'
local M = {
  check_for_updates = false,
  exit_behavior = "CloseOnCleanExit",
  adjust_window_size_when_changing_font_size = true,
  use_ime = true,
  ime_preedit_rendering = "Builtin",
  use_dead_keys = false,
  warn_about_missing_glyphs = false,
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
  audible_bell = "SystemBeep",
  color_scheme = 'Catppuccin Mocha',
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  notification_handling = "SuppressFromFocusedTab",
  leader = { key = "Space", mods = "CTRL|SHIFT" },
  webgpu_preferred_adapter = gpus[1],
  prefer_egl = true,
  front_end = "WebGpu",
  window_padding = { left = 10, right = 10, top = 10, bottom = 10 },
  window_close_confirmation = "AlwaysPrompt",
  window_background_opacity = 0.75,
  initial_cols = 120,
  initial_rows = 35,
}

local os_type = utils.get_current_os()

if os_type == "DARWIN" then
  M.native_macos_fullscreen_mode = true
elseif os_type == "LINUX" then
  local current_session_type = os.getenv("XDG_SESSION_TYPE")
  M.enable_wayland = (current_session_type == "wayland")
end

return M
