local map = require 'phoenix.utils.keymap'

return {
  'dbakker/vim-projectroot',
  config = function()
    map('n', '<C-f>', ":<C-u>ProjectRootExe lua require('telescope.builtin').live_grep({debounce=100})<cr>", { noremap = true, silent = true })
  end,
}
