local lspkind = require("lspkind")
local cmp = require("cmp")

-- lspkind.init({
--   symbol_map = {
--     Copilot = "",
--   },
-- })
--
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
    { name = 'nvim_lsp_signature_help' },
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
      -- symbol_map = {
      --   copilot = ""
      -- },
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
})
