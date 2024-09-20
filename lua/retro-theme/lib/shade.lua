local function shade(color, value)
  if vim.o.background == "light" then
    return color.darken(value)
  else
    return color.lighten(value)
  end
end

return shade
