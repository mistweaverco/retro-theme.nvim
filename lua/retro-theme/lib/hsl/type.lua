local hsl_convert = require("retro-theme.lib.hsl.convert")
local hsl = require("retro-theme.lib.hsl")

--
-- HSL Color
--
-- expects to be called as hsl(hue, sat, light) or hsl("#RRGGBB")
--

local type_fns = {
  from_hex = hsl_convert.hex_to_hsl,
  to_hex = hsl_convert.hsl_to_hex,
  name = function()
    return "hsl()"
  end,
}

local M = function(h_or_hex, s, l)
  return hsl(h_or_hex, s, l, type_fns)
end

return M
