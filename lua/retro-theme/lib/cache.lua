local config = require("retro-theme").config
local path = require("retro-theme.lib.path")
local base_cache_dir = vim.fn.stdpath("cache") .. "/retro-theme"
local nested_cache_dir = base_cache_dir .. "/retro-theme"

-- Ensure the directories exist
if vim.fn.isdirectory(nested_cache_dir) == 0 then
  vim.fn.mkdir(nested_cache_dir, "p")
end

local cache_path = nested_cache_dir .. "/cache.lua"

local M = {}

M.clear = function()
  if config.disable_cache or config.hot_reload then
    return
  end
  if vim.fn.filereadable(cache_path) == 1 then
    assert(os.remove(cache_path))
  end
end

M.exists = function()
  if config.disable_cache or config.hot_reload then
    return false
  end
  return vim.fn.filereadable(cache_path) == 1
end

M.write = function(colors)
  if config.disable_cache or config.hot_reload then
    return
  end
  local serpent = require("retro-theme.lib.serpent")
  local str = serpent.dump(colors)
  local file = io.open(cache_path, "wb")
  file:write(str)
  file:close()
end

M.read = function()
  if config.disable_cache or config.hot_reload then
    return nil
  end

  local colors
  if vim.fn.filereadable(cache_path) == 1 then
    package.path = package.path
      .. ";"
      .. base_cache_dir
      .. "/?.lua;"
      .. base_cache_dir
      .. "/?/init.lua;"
      .. nested_cache_dir
      .. "/?.lua"

    colors = require("retro-theme.cache")
  end

  if not colors then
    return nil
  end
  return colors
end

return M
