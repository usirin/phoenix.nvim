return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    dim = {
      enabled = true,
      animate = { enabled = false },
    },
    input = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    rename = { enabled = true },
    zen = { enabled = true, win = { backdrop = { transparent = false } } },
  },
}
