local t = {
  bg       = "#1c1e26",
  fg       = "#c8d0e0",
  normalFG = "#c8d0e0",
  green    = "#00ffbf",
  red      = "#ff445d",
  purple   = "#bd93f9",
  blue     = "#00dfff",
  blueDark = "#336699",
  grey3    = "#1b1d23",
  grey5    = "#2d333e",
  grey7    = "#384252",
  grey20   = "#4a5a73",
}

return {
  normal = {
    a = { bg = t.blue, fg = t.bg },
    b = { bg = t.grey7, fg = t.fg },
    c = { bg = t.grey3, fg = t.fg }
  },
  insert = {
    a = { bg = t.blueDark, fg = t.bg },
    b = { bg = t.grey7, fg = t.blueDark },
    c = { bg = t.grey3, fg = t.fg }
  },
  visual = {
    a = { bg = t.purple, fg = t.bg },
    b = { bg = t.grey7, fg = t.purple },
    c = { bg = t.grey3, fg = t.fg }
  },
  replace = {
    a = { bg = t.red, fg = t.bg },
    b = { bg = t.grey7, fg = t.red },
    c = { bg = t.grey3, fg = t.fg }
  },
  command = {
    a = { bg = t.green, fg = t.bg },
    b = { bg = t.grey7, fg = t.green },
    c = { bg = t.grey3, fg = t.fg }
  },
  inactive = {
    a = { bg = t.grey20, fg = t.grey3, },
    b = { bg = t.grey5, fg = t.grey20 },
    c = { bg = t.grey5, fg = t.grey20 }
  }
}
