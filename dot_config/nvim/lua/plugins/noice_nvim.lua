local noise = require("noice")
noise.setup({
  messages = {
    enabled = false,
  },
  lsp = {
    progress = {
      enabled = false
    }
  }
})

require("notify").setup({
  background_colour = "#000000",
})
