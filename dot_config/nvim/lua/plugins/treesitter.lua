require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "go",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "vim",
    "yaml",
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
  autotag = {
    enable = true,
  },
})
