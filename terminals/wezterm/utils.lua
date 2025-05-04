-- wezterm/utils.lua
local M = {}

-- 將模組設定合併進主 config
function M.merge_config_into(target, from)
  for k, v in pairs(from) do
    target[k] = v
  end
end

-- 判斷目前是否為 macOS 系統
function M.is_macos()
  return require("wezterm").target_triple:find("apple") ~= nil
end

-- 檢查檔案是否存在（可用於判斷某主題、字體檔案）
function M.path_exists(path)
  local stat = require("wezterm").run_child_process({ "test", "-e", path })
  return stat == 0
end

-- 安全載入模組（不噴錯，適合多模組環境）
function M.try_require(mod)
  local ok, loaded = pcall(require, mod)
  if not ok or type(loaded) ~= "table" then
    return nil
  end
  return loaded
end

return M

