local jsts_formatters = { 'biome', 'prettierd', 'prettier', stop_after_first = true }

return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = jsts_formatters,
      typescript = jsts_formatters,
      typescriptreact = jsts_formatters,
      javascriptreact = jsts_formatters,
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  },
}
