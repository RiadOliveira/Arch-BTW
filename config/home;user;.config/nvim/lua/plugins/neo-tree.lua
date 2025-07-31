return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim"
    },
    lazy = false,
    config = function()
      vim.keymap.set('n', '<C-b>', ':Neotree filesystem reveal right<CR>', {}) 
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        window = { position = "right" }
      })
    end
  }
}
