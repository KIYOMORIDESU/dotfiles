local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {
  ------------------------------------------------------------
  -- lua
  ------------------------------------------------------------
  null_ls.builtins.diagnostics.luacheck.with({
    diagnostics_format = "[luacheck] #{m}\n(#{c})",
    filetypes = { "lua" },
    extra_args = { "--globals", "vim" }
  }),

  ------------------------------------------------------------
  -- Go
  ------------------------------------------------------------
  null_ls.builtins.formatting.goimports.with({
    diagnostics_format = "[goimports] #{m}\n(#{c})",
    filetypes = { "go" },
  }),

  ------------------------------------------------------------
  -- Json
  ------------------------------------------------------------
  null_ls.builtins.formatting.jq.with({
    diagnostics_format = "[jq] #{m}\n(#{c})",
    filetypes = { "json" },
    args = { "--indent", "4" },
  }),
}

null_ls.setup({
  sources = sources
})
