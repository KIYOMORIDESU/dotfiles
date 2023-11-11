local ts = require("telescope")
local actions = require("telescope.actions")

ts.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-d>"] = actions.delete_buffer,
      },
    }
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
    }
  }
})

ts.load_extension("noice")
