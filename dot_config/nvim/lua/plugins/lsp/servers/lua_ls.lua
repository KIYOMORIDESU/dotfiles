local M = {}

function M.setup()
  local nvim_lsp = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  nvim_lsp.lua_ls.setup({
    capabilities = capabilities,
  })
end

return M
