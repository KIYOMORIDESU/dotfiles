local nvim_lsp = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
  ensure_installed = { "lua_ls", "gopls" }
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local opts = {}
    if server_name == "gopls" then
      ---------------------------------------------------------------
      -- Golang (gopls)
      ---------------------------------------------------------------
      opts.settings = {}
    elseif server_name == "lua_ls" then
      ---------------------------------------------------------------
      -- lua (lua_ls)
      ---------------------------------------------------------------
      opts.settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          hints = {
            enable = true,
          },
        },
      }
    else
    end
    nvim_lsp[server_name].setup(opts)
  end,
})
