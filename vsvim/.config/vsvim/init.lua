vim.opt.clipboard = "unnamedplus"
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.ignorecase = true

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("Highlight Yank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
vim.g.maplocalleader = ","
require("lazy").setup({
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, "<cmd>lua require('flash').jump()<cr>", desc = "Flash" },
			{ "S", mode = { "n", "o", "x" }, "<cmd>lua require('flash').treesitter() <cr>", desc = "Flash Treesitter" },
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {
			keymaps = {
				insert = "<C-g>z",
				insert_line = "<C-g>Z",
				normal = "yz",
				normal_cur = "yzz",
				normal_line = "yZ",
				normal_cur_line = "yZZ",
				visual = "Z",
				visual_line = "gZ",
				delete = "dz",
				change = "cz",
				change_line = "cZ",
			},
		},
		config = function(_, opts)
			require("nvim-surround").setup(opts)
		end,
	},

	-- Extend textobjects
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		version = false,
		opts = {
			custom_textobjects = nil,
			mappings = {
				around = "a",
				inside = "i",
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",

				-- Move cursor to corresponding edge of `a` textobject
				goto_left = "g[",
				goto_right = "g]",
			},
			n_lines = 50,
			search_method = "cover_or_next",
			silent = false,
		},
	},
	defaults = { lazy = true, version = nil },
	install = { missing = false },
	checker = { enabled = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})

-- calling whichkey
vim.cmd([[
  nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
  xnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
]])
