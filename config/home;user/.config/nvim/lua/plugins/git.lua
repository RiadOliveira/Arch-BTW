return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "tpope/vim-fugitive",
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "<leader>hd", function()
            gitsigns.diffthis("HEAD")
          end)
          map("n", "<leader>hp", gitsigns.preview_hunk)
          map("n", "<leader>hr", gitsigns.reset_hunk)
          map("n", "<leader>hi", gitsigns.preview_hunk_inline)
          map("n", "<leader>tw", gitsigns.toggle_word_diff)

          map("n", "]c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]c", bang = true })
            else
              gitsigns.nav_hunk("next", { target = "all" })
            end
          end)

          map("n", "[c", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[c", bang = true })
            else
              gitsigns.nav_hunk("prev", { target = "all" })
            end
          end)
        end,
      })
    end,
  },
}
