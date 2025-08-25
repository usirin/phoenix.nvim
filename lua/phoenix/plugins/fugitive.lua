local map = require 'phoenix.utils.keymap'

return {
  -- Theme inspired by twitch colors
  'tpope/vim-fugitive',
  config = function()
    map('n', '<leader>gg', ':vertical G<CR>', { desc = '[g]it Open Fu[g]itive Window' })
    map('n', '<leader>gb', ':0G<CR>', { desc = '[g]it Open Fugitive Window in [b]uffer' })
  end,
  dependencies = {
    'tpope/vim-rhubarb',
  },
}
