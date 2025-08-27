local map = require 'phoenix.utils.keymap'

return {
  'smoka7/hop.nvim',
  opts = {
    keys = 'arstgmneiodh',
  },
  config = function()
    map('n', '<C-e>', "<cmd>lua require'hop'.hint_words()<cr>", { noremap = true, silent = true })
  end,
}
