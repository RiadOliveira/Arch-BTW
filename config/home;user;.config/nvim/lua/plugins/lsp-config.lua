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
      "marksman",
      "nginx_language_server",
      "prismals",
      "pyright",
      "sqlls",
      "yamlls"
    }
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig"
  }
}
