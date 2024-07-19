local del = vim.keymap.del
local set = vim.keymap.set
-- delete default
del("n", "<leader>l") -- :Lazy
del("n", "<leader>L") -- :Lazy
del("n", "<leader>K") -- hover doc
del("n", "<leader>`") -- switch to prev buffer
del("n", "<leader>fn") -- new file
-- del("n", "<leader>xl") -- location list
-- del("n", "<leader>xq") -- quick list
-- del("n", "<leader>cf") -- format
-- del("n", "<leader>cd") -- diagnostic hover
del("n", "<leader>ft") -- LazyVim.terminal @ LazyVim.root()
del("n", "<c-/>") -- LazyVim.terminal @ LazyVim.root()
del("n", "<c-_>") -- LazyVim.terminal @ LazyVim.root()
del("n", "<leader>fT") -- LazyVim.terminal
del("t", "<c-/>")
del("t", "<c-_>")
del("n", "<leader>|") -- vsplit
del("n", "<leader>-") -- split
del("n", "<leader>?") -- buffer keymaps

-- TABS
del("n", "<leader><tab>l")
del("n", "<leader><tab>o")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")

set("n", "<leader>h", "<C-W>s", { desc = "Split Window Below", remap = true })
set("n", "<leader>v", "<C-W>v", { desc = "Split Window Right", remap = true })
