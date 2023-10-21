return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    config = function()
      require('copilot').setup {
        panel = {
          enabled = false, -- using nvim-cmp to do this
          -- enabled = true,
          -- keymap = { open = '<C-t>' },
          -- layout = { position = "right", ratio = 0.2 }
        },
        suggestion = { enabled = false },
        filetypes = { markdown = true, gitcommit = true, help = true },
      }
    end,
  },
}
