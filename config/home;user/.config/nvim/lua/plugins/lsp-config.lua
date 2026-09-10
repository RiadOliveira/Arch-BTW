return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "bashls",
      "lua_ls",
      "clangd",
      "cssls",
      "dockerls",
      "html",
      "jdtls",
      "ts_ls",
      "jsonls",
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
          "java-debug-adapter",
          "js-debug-adapter",
          "stylua",
          "eslint_d",
          "google-java-format",
          "codelldb",
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
