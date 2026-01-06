return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        }),
        null_ls.builtins.formatting.google_java_format,
        require("none-ls.formatting.eslint_d"),
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint_d"),
      },
    })
  end,
}
