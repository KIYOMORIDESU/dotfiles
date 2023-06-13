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
})

ts.load_extension("noice")
