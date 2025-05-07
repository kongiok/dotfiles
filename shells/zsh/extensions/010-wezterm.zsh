# If the WEZTERM_CONFIG_FILE variable is set, return early
if [[ -n "$WEZTERM_CONFIG_FILE" ]]; then
  return 0
fi
export WEZTERM_CONFIG_FILE=$CONFIG_HOME/terminals/wezterm/wezterm.lua
