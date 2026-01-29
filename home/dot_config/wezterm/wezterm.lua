local wezterm = require 'wezterm'
local utils = require 'utils'
local config = wezterm.config_builder()

config:set_strict_mode(true)

utils.merge_tables(config, require 'terminal')
utils.merge_tables(config, require 'keybinds')

require('events').apply_to_config(config)

return config
