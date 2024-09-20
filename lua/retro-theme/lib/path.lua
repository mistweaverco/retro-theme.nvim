local config = require("retro-theme").config

local lua_path = vim.fs.dirname(debug.getinfo(1).source:sub(2)) .. "/.."
local compile_path = lua_path .. "/cache"
local cache_path = compile_path .. "/default.lua"
local palette_colors_path = lua_path .. "/palette/colors.lua"

local M = {}

M.cache = cache_path
M.palette_colors = palette_colors_path

return M
