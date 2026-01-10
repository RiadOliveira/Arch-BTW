return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
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
      "rust_analyzer",
      "marksman",
      "nginx_language_server",
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
        vim.lsp.config("ts_ls", {
          setup = {
            on_attach = function(client)
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end,
          },
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
          "codelldb"
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
    }
  },
}
