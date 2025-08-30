local map = require 'phoenix.utils.keymap'

return {
  'smoka7/hop.nvim',
  version = '*',
  config = function()
    require('hop').setup {
      keys = 'arstgmneiodh',
    }
    map('n', '<C-e>', "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true, silent = true })
  end,
}
