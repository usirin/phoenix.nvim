return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<leader>tt]],
      insert_mappings = false,
      direction = 'float',
    }
  end,
}
