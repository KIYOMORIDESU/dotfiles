local null_ls = require("null-ls")
local util = require("util.command")
local sources = {
  ------------------------------------------------------------
  -- Go
  ------------------------------------------------------------
  null_ls.builtins.formatting.goimports.with({
    diagnostics_format = "[goimports] #{m}\n(#{c})",
    filetypes = { "go" },
    command =  util.ExecuteCommand("go env GOPATH") .. "/bin/goimports" ,
  }),
}

null_ls.setup({
  sources = sources
})
