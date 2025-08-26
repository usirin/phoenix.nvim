local fish_like_path = require 'phoenix.utils.fish_like_path'

local file_status = function(is_modified)
  if is_modified then
    return '·'
  else
    return ''
  end
end

local fishpath = function(level)
  return function()
    local path = fish_like_path(vim.fn.expand '%:p', level)
    local status = file_status(vim.bo.modified)

    if #status == 0 then
      return path
    end

    return path .. ' ' .. status
  end
end

vim.cmd [[
autocmd ColorScheme * lua require'phoenix.plugins.lualine'.config()
autocmd OptionSet background lua require'phoenix.plugins.lualine'.config()
]]

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        globalstatus = true,
        -- theme = 'onedark',
        component_separators = '|',
        section_separators = '',
        -- theme = get_theme(vim.o.background),
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'diff' },
        lualine_c = { fishpath(4) },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { fishpath(2) },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { fishpath(3) },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { fishpath(3) },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            mode = 1,
            max_length = vim.o.columns / 3,
            tabs_color = {
              -- Same values as the general color option can be used here.
              -- active = 'TabLineSel', -- Color for active tab.
              -- inactive = 'TabLine',  -- Color for inactive tab.
            },
          },
        },
        lualine_b = {},
        lualine_c = {},
        -- lualine_x = { "require'phoenix.utils.lsp'.get_attached_clients()" },
        -- lualine_y = {"require'lsp-status'.status()"},
        lualine_z = { { 'branch', icons_enabled = true } },
      },
    }
  end,
}
