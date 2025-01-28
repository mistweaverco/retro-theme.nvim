local lua_path = vim.fs.dirname(debug.getinfo(1).source:sub(2)) .. "/.."
local cache_dir = vim.fn.stdpath("cache") .. "/retro-theme"
if vim.fn.isdirectory(cache_dir) == 0 then
  vim.fn.mkdir(cache_dir, "p")
end
local cache_path = cache_dir .. "/cache.lua"
local palette_colors_path = lua_path .. "/palette/colors.lua"

local M = {}

M.cache = cache_path
M.palette_colors = palette_colors_path

return M
