return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local custom_theme = {
      normal = {
        a = { fg = "#ffffff", bg = "#1c94fc", gui = "bold" },
        b = { fg = "#ffffff", bg = "#9c44fc" },
        c = { fg = "#ffffff", bg = "NONE" },
      },
      insert = {
        a = { fg = "#ffffff", bg = "#1dd260", gui = "bold" },
        b = { fg = "#ffffff", bg = "#9c44fc" },
        c = { fg = "#ffffff", bg = "NONE" },
      },
      visual = {
        a = { fg = "#ffffff", bg = "#fc5ef0", gui = "bold" },
        b = { fg = "#ffffff", bg = "#9c44fc" },
        c = { fg = "#ffffff", bg = "NONE" },
      },
      replace = {
        a = { fg = "#ffffff", bg = "#f71118", gui = "bold" },
        b = { fg = "#ffffff", bg = "#9c44fc" },
        c = { fg = "#ffffff", bg = "NONE" },
      },
      command = {
        a = { fg = "#ffffff", bg = "#ecb90f", gui = "bold" },
        b = { fg = "#ffffff", bg = "#9c44fc" },
        c = { fg = "#ffffff", bg = "NONE" },
      },
      inactive = {
        a = { fg = "#635c8a", bg = "NONE" },
        b = { fg = "#635c8a", bg = "NONE" },
        c = { fg = "#635c8a", bg = "NONE" },
      },
    }

    require("lualine").setup({
      options = { theme = custom_theme },
    })
  end,
}
