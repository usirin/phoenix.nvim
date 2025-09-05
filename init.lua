vim.g.mapleader = ','
vim.g.maplocalleader = ','

local is_vscode = vim.g.vscode

require('phoenix.keymaps').setup()

require('phoenix.defaults').setup(vim.g.vscode)

if is_vscode then
  return
end

require 'setup_lazy'

require('lazy').setup {
  -- handle tabwidth stuff better
  'tpope/vim-sleuth',

  {
    -- colorscheme is always in init.lua
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- require('github-theme').setup {
      --   -- ...
      -- }
      --
      -- vim.cmd 'colorscheme github_dark'
      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd [[highlight CursorLine guibg=#1c1d26]]
    end,
  },

  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = false,
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
        background = { -- :h background
          light = 'latte',
          dark = 'mocha',
        },
        transparent_background = true, -- disables setting the background color.
        float = {
          transparent = true, -- enable transparent floating windows
          solid = false, -- use solid styling for floating windows, see |winborder|
        },
        show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
        term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false, -- dims the background color of inactive window
          shade = 'dark',
          percentage = 0.15, -- percentage of the shade to apply to the inactive window
        },
        no_italic = true, -- Force no italic
        no_bold = false, -- Force no bold
        no_underline = false, -- Force no underline
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = {}, -- Change the style of comments
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = true,
      }

      vim.cmd 'colorscheme catppuccin'
    end,
  },

  -- {
  --   'wnkz/monoglow.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd 'colorscheme monoglow'
  --   end,
  -- },

  -- NOTE: import plugin specs
  { import = 'phoenix.plugins' },
}

-- vim: ts=2 sts=2 sw=2 et
