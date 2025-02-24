M = {}
function M.setup()
  -- setup lsp diagnostics icons
  local icons = require("util.icons")
  for type, icon in pairs(icons.diagnostics) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return M
