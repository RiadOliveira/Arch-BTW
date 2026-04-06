return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = 'make' }
  },
  config = function()
    require("telescope").setup({
      defaults = {
        hidden = true,
        file_ignore_patterns = {
          "%.git/.*",
          "%.png",
          "%.jpg",
          "%.jpeg",
          "%.gif",
          "%.bmp",
          "%.svg",
          "%.ico",
          "%.webp",
          "%.tiff",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, {})
    vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fp", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.grep_string, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
  end,
}
