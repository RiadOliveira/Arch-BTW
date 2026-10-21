return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local eslint_config_files = {
      "eslint.config.js",
      "eslint.config.mjs",
      "eslint.config.cjs",
      "eslint.config.ts",
      "eslint.config.mts",
      "eslint.config.cts",

      ".eslintrc",
      ".eslintrc.js",
      ".eslintrc.cjs",
      ".eslintrc.json",
      ".eslintrc.yaml",
      ".eslintrc.yml",
    }

    local function has_eslint_config(utils)
      return utils.root_has_file(eslint_config_files)
    end

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua.with({
          extra_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        }),
        null_ls.builtins.formatting.google_java_format,
        require("none-ls.formatting.eslint_d").with({ condition = has_eslint_config }),
        require("none-ls.diagnostics.eslint_d").with({ condition = has_eslint_config }),
        require("none-ls.code_actions.eslint_d").with({ condition = has_eslint_config }),
      },
    })
  end,
}
