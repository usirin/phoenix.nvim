local colors = require('phoenix.bleed-purple.colors').dark

local M = {}

local dark_theme = {
  normal = {
    a = { bg = colors.bmagenta, fg = colors.bblack, gui = 'bold' },
    b = { bg = colors.bblack, fg = colors.black },
    c = { bg = colors.status_bg, fg = colors.white },
  },
  insert = { a = { bg = colors.green, fg = colors.black, gui = 'bold' } },
  visual = { a = { bg = colors.yellow, fg = colors.black, gui = 'bold' } },
  replace = { a = { bg = colors.red, fg = colors.black, gui = 'bold' } },
  command = { a = { bg = colors.bblue, fg = colors.black, gui = 'bold' } },
  inactive = {
    a = { bg = colors.status_bg, fg = colors.dimmed_text },
    b = { bg = colors.status_bg, fg = colors.dimmed_text },
    c = { bg = colors.status_bg, fg = colors.dimmed_text },
  },
}

local light_theme = {
  normal = {
    a = { bg = colors.bmagenta, fg = colors.bblack, gui = 'bold' },
    b = { bg = colors.bgreen, fg = colors.black },
    c = { bg = colors.white, fg = colors.black },
  },
  insert = { a = { bg = colors.green, fg = colors.black, gui = 'bold' } },
  visual = { a = { bg = colors.yellow, fg = colors.black, gui = 'bold' } },
  replace = { a = { bg = colors.red, fg = colors.black, gui = 'bold' } },
  command = { a = { bg = colors.bblue, fg = colors.black, gui = 'bold' } },
  inactive = {
    a = { bg = colors.white, fg = colors.dimmed_text },
    b = { bg = colors.white, fg = colors.dimmed_text },
    c = { bg = colors.white, fg = colors.dimmed_text },
  },
}

local get_theme = function(bg)
  if bg == 'light' then
    return light_theme
  end
  return dark_theme
end

--- Only publicly available function
--- so that we control the selected theme from here
M.get_theme = get_theme

return M
