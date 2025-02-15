return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "#000000",
        })
      end
    },
  },
  config = function()
    require("noice").setup({
      messages = {
        enabled = false,
      },
      lsp = {
        progress = {
          enabled = false
        },
        signature = {
          enabled = false
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      }
    })
  end,
}
