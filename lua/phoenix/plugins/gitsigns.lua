local map = require 'phoenix.utils.keymap'

return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { buffer = bufnr, desc = 'Go to next git hunk' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { buffer = bufnr, desc = 'Go to prev git hunk' })

      map('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      map('n', '<leader>gv', require('gitsigns').select_hunk, { buffer = bufnr, desc = 'Git [V]isually select hunk' })
    end,
  },
}
