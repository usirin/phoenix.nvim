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
      vim.cmd 'colorscheme github_dark'
      -- vim.cmd 'colorscheme github_dark_default'
      -- vim.cmd [[highlight CursorLine guibg=#1c1d26]]
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
