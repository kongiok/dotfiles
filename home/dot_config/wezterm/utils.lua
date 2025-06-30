--- @module 'Utils'
local M = {}

function M.merge_tables(t1, t2)
  for k, v in pairs(t2) do
    if (type(v) == "table")
        and (type(t1[k] or false) == "table")
    then
      M.merge_tables(t1[k], t2[k])
    else
      t1[k] = v
    end
  end
  return t1
end

function M.merge_lists(t1, t2)
  local result = {}
  for _, v in pairs(t1) do
    table.insert(result, v)
  end
  for _, v in pairs(t2) do
    table.insert(result, v)
  end
  return result
end

function M.get_current_os()
  local wezterm = require 'wezterm'
  local triple = wezterm.target_triple
  -- make sure is macOS
  if triple:find("darwin") ~= nil then
    return "DARWIN"
  end
  if triple:find("linux") ~= nil then
    return "LINUX"
  end
  if triple:find("windows") ~= nil then
    return "WINDOWS"
  end
end

function M.exists(tab, element)
  for _, value in pairs(tab) do
    if type(value) == "table" then
      return M.exists(value, element)
    elseif value == element then
      return true
    end
  end
  return false
end

return M
