return {
  "nvimdev/lspsaga.nvim",
  event = "VeryLazy",
  branch = "main",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local saga = require("lspsaga")

    saga.setup({
      border_style = "single",
      symbol_in_winbar = {
        enable = true,
        sign = true,
      },
      implement = {
        enable = true,
        sign = true,
      },
      lightbulb = {
        enable = false,
      },
    })
  end,
}
