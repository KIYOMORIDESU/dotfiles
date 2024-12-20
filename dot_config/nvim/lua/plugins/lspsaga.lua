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
    enabled = false,
  },
})
