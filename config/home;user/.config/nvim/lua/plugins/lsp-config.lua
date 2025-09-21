return {
  "mason-org/mason-lspconfig.nvim",
  opts = { auto_install = true },
  ensure_installed = {
    "lua_ls",
    "bashls",
    "clangd",
    "cmake",
    "cssls",
    "dockerls",
    "html",
    "jdtls",
    "ts_ls",
    "jsonls",
    "marksman",
    "nginx_language_server",
    "prismals",
    "pyright",
    "docker_compose_language_service",
    "tailwindcss",
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
        vim.lsp.config("ts_ls", {
          setup = {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          },
        })

        vim.lsp.config("jdtls", {
          on_attach = function(client)
            client.server_capabilities.semanticTokensProvider = false
          end,
        })
      end,
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "eslint_d",
          "prettierd",
          "google-java-format",
        },
        auto_update = true,
        run_on_start = true,
      },
    },
  },
}
