local M = {}

function M.setup()
  local nvim_lsp = require("lspconfig")
  local command_util = require("util.command")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  nvim_lsp.gopls.setup({
    cmd = { command_util.ExecuteCommand({ "go", "env", "GOPATH" }) .. "/bin/gopls" },
    capabilities = capabilities,
  })
end

return M
