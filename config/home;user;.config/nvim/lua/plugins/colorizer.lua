return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      "css",
      "jsx",
      "tsx",
      "html",
      "conf",
    })
  end,
}
