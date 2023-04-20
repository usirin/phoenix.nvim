-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require('neo-tree').setup {
      window = {
        position = "float",
      },
      filesystem = {
        follow_current_file = true,
        window = {
          mappings = {
            ["o"] = "open",
          }
        }
      }
    }

    vim.keymap.set("n", "<leader>kb", ":Neotree reveal_force_cwd<cr>", { noremap = true, silent = true })
  end,
}
