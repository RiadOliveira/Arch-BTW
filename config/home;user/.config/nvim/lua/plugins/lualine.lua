return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local function wide_enough()
      return vim.fn.winwidth(0) >= 120
    end

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
      options = {
        theme = custom_theme,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diagnostics",
            sources = { "nvim_diagnostic", "nvim_lsp" },
            sections = { "error", "warn", "info", "hint" },
            diagnostics_color = {
              error = { fg = "#ffffff" },
              warn = { fg = "#ffffff" },
              info = { fg = "#ffffff" },
              hint = { fg = "#ffffff" },
            },
          },
        },
        lualine_c = {
          { "filename", path = 1 },
        },
        lualine_x = {
          { "encoding", cond = wide_enough },
          { "fileformat", cond = wide_enough },
          { "filetype", cond = wide_enough },
        },
        lualine_y = {
          { "progress", cond = wide_enough },
        },
        lualine_z = {
          { "location", cond = wide_enough },
        },
      },
    })
  end,
}
