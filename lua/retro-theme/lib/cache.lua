local config = require("retro-theme").config
local path = require("retro-theme.lib.path")

local M = {}

M.clear = function()
  if config.disable_cache or config.hot_reload then
    return
  end
  if vim.fn.filereadable(path.cache) == 1 then
    assert(os.remove(path.cache))
  end
end

M.exists = function()
  if config.disable_cache or config.hot_reload then
    return false
  end
  return vim.fn.filereadable(path.cache) == 1
end

M.write = function(colors)
  if (config.disable_cache or config.hot_reload) then
    return
  end
  local serpent = require("retro-theme.lib.serpent")
  local str = serpent.dump(colors)
  local file = io.open(path.cache, "wb")
  file:write(str)
  file:close()
end

M.read = function()
  if (config.disable_cache or config.hot_reload) then
    return nil
  end
  local colors = require('retro-theme.cache.default')
  if not colors then
    return nil
  end
  return colors
end

return M
