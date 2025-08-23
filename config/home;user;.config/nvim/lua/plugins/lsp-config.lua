return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    auto_install = true,
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
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "eslint_d",
          "prettierd",
        },
        auto_update = true,
        run_on_start = true,
      },
    },
  },
  config = function()
    require("lspconfig").ts_ls.setup({
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    })
  end,
}
