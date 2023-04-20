return {
  "stevearc/dressing.nvim",
  config = function()
    require("dressing").setup({
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
        telescope = require("telescope.themes").get_cursor(),
      },
    })
  end,
}
