-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = " "

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Clear search highlighting with <leader> and c
map("n", "<ESC><ESC>", ":nohl<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map("n", "<C-t>", ":Term<CR>", { noremap = true }) -- open
map("t", "<Esc>", "<C-\\><C-n>")                   -- exit

-----------------------------------------------------------
-- lsp
-----------------------------------------------------------

map("n", "gd", vim.lsp.buf.definition)

-----------------------------------------------------------
-- nvim-tree
-----------------------------------------------------------

map("n", "<C-n>", ":NvimTreeToggle<CR>")

-----------------------------------------------------------
-- Telescope
-----------------------------------------------------------

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")

-----------------------------------------------------------
-- Format
-----------------------------------------------------------
local function format()
  vim.lsp.buf.format({ async = true })
end

map("n", "<leader>fm", format)
-----------------------------------------------------------
-- hop
-----------------------------------------------------------
map("n", "mw", ":HopWord<CR>")
map("n", "ml", ":HopLineStart<CR>")

-----------------------------------------------------------
-- Lspsaga
-----------------------------------------------------------
map("n", "<leader>gd", ":Lspsaga finder<CR>")
map("n", "<leader>ca", ":Lspsaga code_action<CR>")
map("n", "<leader>ol", ":Lspsaga outline<CR>")
map("n", "<S-k>", ":Lspsaga hover_doc<CR>")
map("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "]e", ":Lspsaga diagnostic_jump_next<CR>")

-----------------------------------------------------------
-- Buffer
-----------------------------------------------------------
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-----------------------------------------------------------
-- Trouble
-----------------------------------------------------------

map("n", "<C-b>", ":TroubleToggle<CR>")

-----------------------------------------------------------
-- Toggleterm
-----------------------------------------------------------

-- toggleterm tab
map("n", "<S-t><S-t>", ":ToggleTerm direction=tab<CR>")

-- toggleterm
map("n", "<S-t><S-f>", ":ToggleTerm direction=float<CR>")

-- toggleterm split window
map("n", "<S-t><S-w>", ":ToggleTerm<CR>")


--gitui

local Terminal = require('toggleterm.terminal').Terminal
local gitui    = Terminal:new({
  cmd = "gitui",
  hidden = true,
  direction = "float",
})

map(
  "n",
  "<leader>gt",
  function()
    gitui:toggle()
  end
)
-----------------------------------------------------------
-- Comment
-----------------------------------------------------------

local comment = require('Comment.api')
map("n", "<leader>/", comment.toggle.linewise.current)
map("v", "<leader>/", function()
  comment.toggle.linewise(vim.fn.visualmode())
end)

-----------------------------------------------------------
-- Gitsigns
-----------------------------------------------------------
map("n", "[g", ":Gitsigns prev_hunk<CR>")
map("n", "]g", ":Gitsigns next_hunk<CR>")
