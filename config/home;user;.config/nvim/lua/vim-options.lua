vim.cmd("packadd! nohlsearch")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.list = true
vim.o.number = true
vim.o.confirm = true
vim.o.expandtab = true
vim.o.smartcase = true
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.relativenumber = true
vim.opt.termguicolors = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.scrolloff = 10

vim.opt.fillchars:append({ eob = " " })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader><Tab>", "<C-w>w")
vim.keymap.set("n", "<C-q>", ":q<CR>")

vim.keymap.set("n", "<C-a>", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("n", "ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<C-s>", function()
  vim.lsp.buf.format()
  vim.cmd("write")
end)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.keymap.set({ "t", "i" }, "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set({ "t", "i" }, "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set({ "t", "i" }, "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set({ "t", "i" }, "<C-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set({ "n" }, "<C-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l")

vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", '"+yy', { noremap = true, silent = true })

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
  signs = false,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
