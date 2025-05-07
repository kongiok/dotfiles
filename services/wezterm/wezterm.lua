local wezterm = require("wezterm")
local cfg_dir = wezterm.config_dir or os.getenv("CFGDIR") .. "/terminals/wezterm"
package.path = package.path .. ";" .. cfg_dir .. "/?.lua"

local utils = require("utils")
local config = wezterm.config_builder()
local forge_configs = {
  -- "configs.keys",
  "configs.interfaces",
  -- "configs.os_specific",
  "configs.interactives"
}

for _, mod in ipairs(forge_configs) do
  local loaded = utils.try_require(mod)
  if not loaded then
    wezterm.log_warn("⚠️ Failed to load module: " .. mod)
  else
    wezterm.log_info("✅ Loaded module: " .. mod)
    utils.merge_config_into(config, loaded)
  end
end


return config
