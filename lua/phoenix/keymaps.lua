local map = require 'phoenix.utils.keymap'

local M = {}

M.setup = function()
  map('n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>')
  map('n', '<leader>ed', ':e ~/dotfiles/install.sh<CR>')

  map('i', 'jj', '<Esc>')
  map('t', 'jj', [[<C-\><C-n>]])

  map('n', '<leader><space>', ':nohlsearch<cr>')
  map('n', '<leader><leader>', '<C-^>')

  map('n', ';', ':', { silent = false })
  map('v', ';', ':')
  map('n', '<Enter>', 'o<Esc>')
  map('n', '<space>', 'i<space><C-c>l')

  -- Better split switching
  map('n', '<C-J>', '<C-W>j')
  map('n', '<C-K>', '<C-W>k')
  map('n', '<C-H>', '<C-W>h')
  map('n', '<C-L>', '<C-W>l')

  -- easy splits | for vertical _ for horizontal
  map('n', '<bar>', ':vsp<CR>')
  map('n', '_', [[Hmx``<C-w>szz<C-w><C-p>`x``<C-w><C-p>]])

  -- tabs
  map('n', 'tt', ':tabe %<cr>')
  map('n', '[t', ':tabprev<cr>')
  map('n', 't[', ':tabprev<cr>')
  map('n', ']t', ':tabnext<cr>')
  map('n', 't]', ':tabnext<cr>')
  map('n', '[T', ':tabfirst<cr>')
  map('n', ']T', ':tablast<cr>')

  map('n', ']f', ':cnext<cr>')
  map('n', '[f', ':cprev<cr>')

  -- Diagnostic keymaps
  map('n', '[q', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  map('n', ']q', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  map('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  -- map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  -- map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

  -- quickfix things
  map('n', '<leader>qo', ':copen<cr>', { desc = '[q]uickfix: [o]pen' })
  map('n', '<leader>qc', ':cclose<cr>', { desc = '[q]uickfix: [c]lose' })
  map('n', '<leader>qn', ':cnext<cr>', { desc = '[q]uickfix: [n]ext' })
  map('n', '<leader>qp', ':cprev<cr>', { desc = '[q]uickfix: [p]revious' })

  -- Remap for dealing with word wrap
  map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
  map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
end

return M
