-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.runtimepath:prepend(lazypath)

local plugins = {
  -----------------------------------------------------------
  -- git
  -----------------------------------------------------------
  { import = "plugins.util.git" },

  -----------------------------------------------------------
  -- lsp & completion
  -----------------------------------------------------------
  { import = "plugins.lsp.lsp-config" },
  { import = "plugins.lsp.none-ls" },
  { import = "plugins.lsp.trouble-nvim" },
  -----------------------------------------------------------
  -- AI
  -----------------------------------------------------------
  { import = "plugins.ai" },

  -----------------------------------------------------------
  -- ui
  -----------------------------------------------------------
  { import = "plugins.ui" },

  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "folke/noice.nvim"
    },
    config = function()
      require("plugins.telescope")
    end,
  },


  {
    's1n7ax/nvim-window-picker',
    config = function()
      require('plugins.nvim-window-picker')
    end

  },

  -----------------------------------------------------------
  -- treesitter
  -----------------------------------------------------------

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    run = ":TSUpdate",
    config = function()
      require("plugins.treesitter")
    end,
  },

  -----------------------------------------------------------
  -- util tool
  -----------------------------------------------------------

  { import = "plugins.util" },

  -----------------------------------------------------------
  -- debugger & dap
  -----------------------------------------------------------

  { import = "plugins.dap" },

  -----------------------------------------------------------
  -- ui
  -----------------------------------------------------------
  {
    "p00f/nvim-ts-rainbow",
    event = "VeryLazy",
  },
}

require("lazy").setup(plugins, {})
