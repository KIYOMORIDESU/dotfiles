return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      config = function()
        require("copilot").setup({})
      end
    },
  },
  config = function()
    require("copilot_cmp").setup()
  end
}
