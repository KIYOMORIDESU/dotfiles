require("indent_blankline").setup({
  show_current_context = true,
  show_current_context_start = true,
  space_char_blankline = " ",
})

-- vim.cmd([[highlight IndentBlanklineSpaceCharBlankline cterm=nocombine ctermfg=12 gui=nocombine guifg=Gray]])
-- vim.cmd([[highlight IndentBlanklineSpaceChar cterm=nocombine ctermfg=12 gui=nocombine guifg=Gray]])
-- vim.cmd([[highlight IndentBlanklineChar cterm=nocombine ctermfg=12 gui=nocombine guifg=Gray]])
-- vim.cmd([[highlight IndentBlanklineContextStart cterm=underline gui=underline guisp=#ffffff]])
-- vim.cmd([[highlight IndentBlanklineContextChar cterm=nocombine ctermfg=11 gui=nocombine guifg=#ffffff]])
