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
  {
    "NeogitOrg/neogit",
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.neogit")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.gitsigns")
    end,
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.diffview")
    end,
  },

  {
    "dinhhuy258/git.nvim",
    config = function()
      require("plugins.gitnvim")
    end,
  },

  -----------------------------------------------------------
  -- lsp & completion
  -----------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.lsp-config")
    end,
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        config = function()
          require("plugins.cmp-nvim-lsp")
        end,
      },
      {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        config = function()
          require("plugins.nvim-cmp")
        end,
        dependencies = {
          "hrsh7th/cmp-vsnip",
          "hrsh7th/vim-vsnip",
          "onsails/lspkind.nvim",
          "zbirenbaum/copilot-cmp"
        }
      },
      {
        "nvimdev/lspsaga.nvim",
        event = "VeryLazy",
        branch = "main",
        dependencies = {
          "nvim-treesitter/nvim-treesitter",
          "nvim-tree/nvim-web-devicons",
        },
        config = function()
          require("plugins.lspsaga")
        end,
      },
      {
        "folke/lsp-colors.nvim",
        config = function()
          require("plugins.lsp-colors")
        end,
      },
      {
        "aznhe21/actions-preview.nvim",
        config = function()
          require("actions-preview").setup {}
        end,
      },
    }
  },

  -- linter & formatter
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    after = { "nvim-lspconfig" },
    config = function()
      require("plugins.null-ls")
    end,
  },

  -----------------------------------------------------------
  -- copilot
  -----------------------------------------------------------

  -- {
  --   "github/copilot.vim",
  --   event = "VeryLazy",
  -- },
  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("copilot").setup({})
    end
  },

  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot_cmp").setup()
    end
  },

  -----------------------------------------------------------
  -- test runner
  -----------------------------------------------------------

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go"
    },
    config = function()
      require("plugins.neotest")
    end,
  },

  -----------------------------------------------------------
  -- ui
  -----------------------------------------------------------

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("plugins.noice_nvim")
    end,
  },

  {
    "sidebar-nvim/sidebar.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.sidebar-nvim")
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    event = { "BufReadPre", "BufNewFile", "BufWinEnter" },
    config = function()
      require("plugins.nvim-scrollbar")
    end,
  },

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
    "folke/trouble.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.trouble")
    end,
  },

  {
    "folke/zen-mode.nvim",
  },

  -----------------------------------------------------------
  -- nvim-tree
  -----------------------------------------------------------

  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    tag = "nightly",
    config = function()
      require("plugins.nvim-tree")
    end,
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

  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("plugins.nvim-autopairs")
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.comment")
    end
  },

  -----------------------------------------------------------
  -- code jump
  -----------------------------------------------------------
  {
    "phaazon/hop.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.hop")
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
      },
      {
        "S",
        mode = { "o", "x" },
        function()
          require("flash").treesitter()
        end,
      },
    },
  },

  -----------------------------------------------------------
  -- terminal
  -----------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.toggleterm")
    end,
  },

  -----------------------------------------------------------
  -- debugger & dap
  -----------------------------------------------------------
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    -- config = function()
    --   require("plugins.dap")
    -- end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
  },
  {
    "leoluz/nvim-dap-go",
    event = "VeryLazy",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
  },

  -----------------------------------------------------------
  -- ui
  -----------------------------------------------------------
  -- color scheme
  { "folke/tokyonight.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "nyoom-engineering/nyoom.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "bluz71/vim-nightfly-colors" },
  { "bluz71/vim-moonfly-colors" },
  { "savq/melange-nvim" },
  { "AlexvZyl/nordic.nvim" },
  {
    "mcchrish/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function()
      require("plugins.colorizer")
    end
  },

  {
    "p00f/nvim-ts-rainbow",
    event = "VeryLazy",
  },

  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.todo-comments")
    end,
  },

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("plugins.nvim-transparent")
    end
  },

  -- ui
  {
    "nvim-lualine/lualine.nvim",
    event = { "InsertEnter", "CursorHold", "FocusLost", "BufRead", "BufNewFile" },
    config = function()
      require("plugins.lualine")
    end,
    dependencies = {
      {
        'linrongbin16/lsp-progress.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          require('plugins.lsp-progress')
        end
      },
    }
  },


  {
    "akinsho/bufferline.nvim",
    config = function()
      require("plugins.bufferline")
    end,
  },

  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     require("plugins.indent-blankline")
  --   end,
  -- },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("plugins.hlchunk")
    end
  },
}

require("lazy").setup(plugins, {})
