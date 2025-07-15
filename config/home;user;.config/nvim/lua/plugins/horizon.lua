return {
  "akinsho/horizon.nvim",
  version = "*",
  opts = {
    plugins = {
      telescope = true
    }
  },
  config = function()
    vim.cmd.colorscheme('horizon')
    vim.cmd [[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi FloatBorder guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi EndOfBuffer guifg=#635c8a guibg=NONE

      hi StatusLine guifg=#fc5ef0 guibg=NONE
      hi StatusLineNC guifg=#fc5ef0 guibg=NONE
      hi MsgArea guibg=NONE ctermbg=NONE
      hi ModeMsg guibg=#2e2a45 guifg=#ffffff
      hi WinSeparator guibg=NONE ctermbg=NONE

      hi CursorLine guibg=#2a2640
      hi CursorLineNr guifg=#ffffff guibg=#2a2640
      hi LineNr guifg=#635c8a guibg=NONE

      hi TelescopeNormal guibg=NONE
      hi TelescopePromptNormal guibg=NONE
      hi TelescopeResultsNormal guibg=NONE
      hi TelescopePreviewNormal guibg=NONE

      hi TelescopeBorder guifg=#1064ad guibg=NONE
      hi TelescopePromptBorder guifg=#1064ad guibg=NONE
      hi TelescopeResultsBorder guifg=#1064ad guibg=NONE
      hi TelescopePreviewBorder guifg=#1064ad guibg=NONE

      hi TelescopePromptTitle guifg=#fc5ef0 guibg=NONE
      hi TelescopeResultsTitle guifg=#fc5ef0 guibg=NONE
      hi TelescopePreviewTitle guifg=#fc5ef0 guibg=NONE

      hi TelescopePromptPrefix guifg=#fc5ef0 guibg=NONE
      hi TelescopePromptCounter guifg=#fc5ef0 guibg=NONE

      hi TelescopeSelectionCaret guifg=#9c44fc guibg=#9c44fc
      hi TelescopeMatching guifg=#9c44fc

      hi TelescopeSelection guifg=NONE guibg=#2a2640
    ]]
  end
}
