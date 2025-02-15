return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require('statuscol.builtin')
    require('statuscol').setup({
      relculright = true,
      segments = {
        {
          sign = { namespace = { "diagnostic/signs" }, maxwidth = 1, auto = false },
          click = "v:lua.ScSa"
        },

        {
          sign = {
            namespace = { 'gitsigns' },
            maxwidth = 1,
            colwidth = 1,
            wrap = true,
          },
        },
        {
          text = { builtin.lnumfunc },
        },
      },
    })
  end
}

--   config = function()
--     local builtin = require("statuscol.builtin")
--     require("statuscol").setup({
--       -- configuration goes here, for example:
--       -- relculright = true,
--       segments = {
--         { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
--         {
--           sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
--           click = "v:lua.ScSa"
--         },
--         { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
--         {
--           sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
--           click = "v:lua.ScSa"
--         },
--         {
--           sign = {
--             namespace = { "gitsigns" },
--             maxwidth = 1,
--             colwidth = 1,
--             wrap = true,
--           },
--         }
--       }
--     })
--   end
