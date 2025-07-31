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
      hi WinSeparator guifg=#1064ad guibg=NONE ctermbg=NONE
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

      hi NeoTreeNormal guibg=NONE ctermbg=NONE
      hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
      hi NeoTreeVertSplit guifg=#1064ad guibg=NONE
      hi NeoTreeWinSeparator guifg=#1064ad guibg=NONE
      hi NeoTreeEndOfBuffer guifg=#635c8a guibg=NONE
      hi NeoTreeRootName guifg=#fc5ef0 gui=bold
      hi NeoTreeDirectoryName guifg=#ffffff
      hi NeoTreeDirectoryIcon guifg=#1064ad
      hi NeoTreeFileNameOpened guifg=#fc5ef0
      hi NeoTreeFileName guifg=#ffffff
      hi NeoTreeFileIcon guifg=#9c44fc
      hi NeoTreeIndentMarker guifg=#635c8a
      hi NeoTreeExpander guifg=#1064ad
      hi NeoTreeDimText guifg=#635c8a
      hi NeoTreeFilterTerm guifg=#9c44fc gui=bold
      hi NeoTreeFloatBorder guifg=#1064ad guibg=NONE
      hi NeoTreeFloatTitle guifg=#fc5ef0 guibg=NONE
      hi NeoTreeTitleBar guifg=#fc5ef0 guibg=NONE
      hi NeoTreeCursorLine guibg=#2a2640
      hi NeoTreeDotfile guifg=#635c8a
      hi NeoTreeMessage guifg=#fc5ef0
      hi NeoTreeModified guifg=#9c44fc
      hi NeoTreeGitAdded guifg=#21c7a8
      hi NeoTreeGitDeleted guifg=#e95678
      hi NeoTreeGitModified guifg=#fab795
      hi NeoTreeGitConflict guifg=#fc5ef0
      hi NeoTreeGitUntracked guifg=#635c8a
      hi NeoTreeGitIgnored guifg=#635c8a
      hi NeoTreeGitStaged guifg=#21c7a8
    ]]
  end
}
