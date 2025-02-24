return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- lsp server configurations
    require("plugins.lsp.servers.gopls").setup()
    require("plugins.lsp.servers.lua_ls").setup()

  end,
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      config = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        lspkind.init({
          symbol_map = {
            Copilot = "",
          }
        })

        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            -- { name = 'nvim_lsp_signature_help' },
            { name = 'copilot' },
          }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          formatting = {
            format = lspkind.cmp_format({
              with_text = true,
              mode = "symbol_text",
            }),
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ['<C-Space>'] = cmp.mapping.complete(),
          }),
        })
      end,
      dependencies = {
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "onsails/lspkind.nvim",
        "zbirenbaum/copilot-cmp"
      }
    },
    require("plugins.lsp.lspsaga"),
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup()
      end,
    },
    {
      "aznhe21/actions-preview.nvim",
      config = function()
        require("actions-preview").setup()
      end,
    },
  }
}
