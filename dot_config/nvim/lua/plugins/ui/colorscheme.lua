return {
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/nyoom.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "bluz71/vim-moonfly-colors" },
  { "savq/melange-nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "savq/melange-nvim" },
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      -- Default options:
      require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        theme = "wave",        -- Load "wave" theme when 'background' option is not set
        background = {         -- map the value of 'background' option to a theme
          dark = "dragon",     -- try "dragon" !
          -- light = "lotus"
        },
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  }
}
