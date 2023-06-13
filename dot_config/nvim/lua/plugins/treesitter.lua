require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua", "vim", "markdown", "markdown_inline", "go", "json", "yaml"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_line = 200,
  },
})
