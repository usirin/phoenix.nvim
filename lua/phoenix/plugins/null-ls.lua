return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local b = null_ls.builtins

    local sources = {
      -- formatting
      b.formatting.prettierd,
      b.formatting.stylua.with({
        condition = function(utils)
          return utils.root_has_file({ "stylua.toml", ".stylua.toml" })
        end,
      }),

      b.formatting.goimports.with({
        args = {
          "-srcdir", "$DIRNAME", "-local=code.justin.tv", "-w", "cmd", "errorutils", "internal", "loaders", "resolvers"
        }
      }),

      b.formatting.beautysh,

      -- require("typescript.extensions.null-ls.code-actions"),

      b.formatting.eslint_d,

      -- b.diagnostics.eslint_d,
      -- b.code_actions.eslint_d,
    }

    null_ls.setup({
      -- debug = true,
      sources = sources,
    })
  end
}
