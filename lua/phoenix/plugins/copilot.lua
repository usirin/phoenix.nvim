return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = true,
          keymap = { open = '<leader>co' },
          layout = { position = "right", ratio = 0.2 }
        },
        suggestion = { enabled = false },
        filetypes = { markdown = true, gitcommit = true }
      }
    end,
  },
}
