local del = vim.keymap.del
local set = vim.keymap.set

---------------------------------------------------------------------------
-- DELETE DEFAULT BINDINGS
---------------------------------------------------------------------------
del("n", "<leader>l") -- :Lazy
del("n", "<leader>L") -- :Lazy
del("n", "<leader>K") -- hover doc
del("n", "<leader>`") -- switch to prev buffer
del("n", "<leader>fn") -- new file
-- del("n", "<leader>xl") -- location list
-- del("n", "<leader>xq") -- quick list
-- del("n", "<leader>cf") -- format
-- del("n", "<leader>cd") -- diagnostic hover
del("n", "<leader>|") -- vsplit
del("n", "<leader>-") -- split
del("n", "<leader>?") -- buffer keymaps
del("n", "<leader>ft") -- terminal
del("n", "<leader>fT") -- terminal

-- profiler
del("n", "<leader>dph")
del("n", "<leader>dps")
del("n", "<leader>dpp")

-- TABS
del("n", "<leader><tab>l")
del("n", "<leader><tab>o")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- Lazygit
del("n", "<leader>gG")
del("n", "<leader>gb")
del("n", "<leader>gl")
del("n", "<leader>gL")

del("n", "<leader>xl") -- location list
del("n", "<leader>xq") -- quickfix list

---------------------------------------------------------------------------
-- SET BINDINGS
---------------------------------------------------------------------------
set("n", "<C-h>", "<cmd>NavigatorLeft<cr>")
set("n", "<C-j>", "<cmd>NavigatorDown<cr>")
set("n", "<C-k>", "<cmd>NavigatorUp<cr>")
set("n", "<C-l>", "<cmd>NavigatorRight<cr>")

set("i", "<C-h>", "<cmd>NavigatorLeft<cr>")
set("i", "<C-j>", "<cmd>NavigatorDown<cr>")
set("i", "<C-k>", "<cmd>NavigatorUp<cr>")
set("i", "<C-l>", "<cmd>NavigatorRight<cr>")

set("v", "<C-h>", "<cmd>NavigatorLeft<cr>")
set("v", "<C-j>", "<cmd>NavigatorDown<cr>")
set("v", "<C-k>", "<cmd>NavigatorUp<cr>")
set("v", "<C-l>", "<cmd>NavigatorRight<cr>")

set("t", "<C-h>", "<cmd>NavigatorLeft<cr>")
set("t", "<C-j>", "<cmd>NavigatorDown<cr>")
set("t", "<C-k>", "<cmd>NavigatorUp<cr>")
set("t", "<C-l>", "<cmd>NavigatorRight<cr>")

set("t", "<esc><esc>", "<C-\\><C-n>")

set("n", "<leader>h", "<C-W>s", { desc = "Split Window Below", remap = true })
set("n", "<leader>v", "<C-W>v", { desc = "Split Window Right", remap = true })
