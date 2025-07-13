return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { 
        "bash", "c", "cmake", "cpp",
        "css", "csv", "dockerfile", "gitignore",
        "html", "ini", "java", "javascript",
        "json", "json5", "jsonc", "lua",
        "make", "markdown", "markdown_inline", "nginx",
        "prisma", "python", "sql", "tsx",
        "typescript", "udev", "xml", "yaml"
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end
}
