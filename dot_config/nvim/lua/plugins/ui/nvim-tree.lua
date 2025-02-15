return {
  "nvim-tree/nvim-tree.lua",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeClose",
    "NvimTreeRefresh",
    "NvimTreeFindFile",
  },
  config = function()
    require("nvim-tree").setup({
      diagnostics = {
        enable = true,
      },
      view = {
        adaptive_size = true,
        width = 35,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            picker = require("window-picker").pick_window,
          }
        }
      }
    })
  end,
}
