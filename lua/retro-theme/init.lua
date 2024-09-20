local M = {}

local defaultConfig = {
  italic_comments = true,
  disable_cache = false,
  hot_reload = false,
}

M.config = defaultConfig

function M.reload()
  M.load()
end

function M.load()
  require("retro-theme.colorscheme")
  vim.g.colors_name = "retro-theme"
end

function M.clear_cache()
  require("retro-theme.lib.cache").clear()
end

function M.setup(options)
  M.config = vim.tbl_deep_extend("force", {}, defaultConfig, options or {})
  if M.config.hot_reload then
    local path = require("retro-theme.lib.path")
    require("retro-theme.lib.hotreload").watch(path.palette_colors)
  end
end

return M
