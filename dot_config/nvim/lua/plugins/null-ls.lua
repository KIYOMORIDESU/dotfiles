local null_ls = require("null-ls")
local helpers = require("null-ls.helpers")
local util = require("util.command")

local sources = {
  ------------------------------------------------------------
  -- Go
  ------------------------------------------------------------
  null_ls.builtins.formatting.goimports.with({
    diagnostics_format = "[goimports] #{m}\n(#{c})",
    filetypes = { "go" },
    command = util.ExecuteCommand("go env GOPATH") .. "/bin/goimports",
  }),
  ------------------------------------------------------------
  -- Json
  ------------------------------------------------------------
  -- TODO:
  ------------------------------------------------------------
  -- Yaml
  ------------------------------------------------------------
  null_ls.builtins.formatting.yamlfmt.with({
    filetypes = { "yaml", "yml" },
  }),
}

null_ls.setup({
  sources = sources,
  debug = true,
})
