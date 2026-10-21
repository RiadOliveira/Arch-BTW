return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "lua_ls",
      "bashls",
      "clangd",
      "cssls",
      "dockerls",
      "html",
      "jdtls",
      "ts_ls",
      "jsonls",
      "oxlint",
      "rust_analyzer",
      "marksman",
      "prismals",
      "pyright",
      "docker_compose_language_service",
      "tailwindcss",
    },
    automatic_enable = {
      exclude = { "jdtls", "rust_analyzer" },
    },
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "mason-org/mason.nvim",
      opts = {},
    },
    {
      "neovim/nvim-lspconfig",
      config = function()
        local ts_ls_config = vim.lsp.config.ts_ls or {}
        local default_on_attach = ts_ls_config.on_attach

        vim.lsp.config("ts_ls", {
          on_attach = function(client, bufnr)
            if default_on_attach then
              default_on_attach(client, bufnr)
            end

            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        })
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "oxfmt",
          "eslint_d",
          "codelldb",
          "google-java-format",
          "js-debug-adapter",
          "java-debug-adapter",
        },
        auto_update = true,
        run_on_start = true,
      },
    },
    {
      "mfussenegger/nvim-jdtls",
      ft = { "java" },
    },
    {
      "mrcjkb/rustaceanvim",
      version = "^6",
      lazy = false,
    },
  },
}
