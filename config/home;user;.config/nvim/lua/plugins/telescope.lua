return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require('telescope').setup({
      defaults = {
        hidden = true,
        file_ignore_patterns = {
          "node_modules/.*",
          "%.git/.*",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end
        },
      }
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
