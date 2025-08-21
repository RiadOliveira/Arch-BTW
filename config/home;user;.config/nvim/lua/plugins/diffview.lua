return {
  "sindrets/diffview.nvim",
  config = function()
    vim.keymap.set("n", "do", ":DiffviewOpen<CR>")
    vim.keymap.set("n", "dq", ":DiffviewClose<CR>")
    vim.keymap.set("n", "dh", ":DiffviewFileHistory<CR>")
  end,
}
