local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config:set_strict_mode(true)
local utils = require 'utils'

-- Local Configs
local core_config = {}
utils.merge_tables(core_config, require 'terminal')

config = core_config
return config
