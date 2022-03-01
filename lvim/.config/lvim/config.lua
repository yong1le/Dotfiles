vim.o.relativenumber = true
vim.o.timeoutlen = 300

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "darkplus"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

--Terminal navigation
lvim.keys.term_mode["jk"] = "<C-\\><C-n>"
lvim.keys.term_mode["``"] = "<C-c><C-\\><C-n>:ToggleTerm<cr>"
lvim.keys.normal_mode["``"] = ":ToggleTerm<cr>"

-- Buffer Switching
lvim.keys.normal_mode["<TAB>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferLineCyclePrev<cr>"

-- Running code
_G.run_code = function()
	local ft = vim.api.nvim_buf_get_option(0, "filetype")

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end
	if ft == "python" then
		return ":w | TermExec cmd='python3 \"%:p\"' go_back=0" .. t("<CR>")
	elseif ft == "java" then
		return ":w | TermExec cmd='javac \"%:p\" && java \"%:p\"' go_back=0" .. t("<CR>")
	elseif ft == "javascript" then
		return ":w | TermExec cmd='node \"%:p\"' go_back=0" .. t("<CR>")
	elseif ft == "cpp" then
		return ":w | TermExec cmd='g++ -o \"%:p:r.o\" \"%:p\" && \"%:p:r.o\"' go_back=0" .. t("<CR>")
	elseif ft == "lua" then
		return ":w | luafile \"%\"" .. t("<CR>")
  elseif ft == "html" then
    return ':TermExec cmd=\'browser-sync start --server --files "*.js, *.html, *.css"\'' .. t("<CR>")
	else
		return ":w" .. t("<CR>")
	end
end

vim.api.nvim_set_keymap("n", "<space>r", "v:lua.run_code()", { expr = true })

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.shading_factor = 1
lvim.builtin.terminal.size = 15
-- Whichkey
lvim.builtin.which_key.mappings["G"] = { '<cmd>TermExec cmd="lazygit"<cr>', "Lazygit" }
lvim.builtin.which_key.mappings[","] = {"<cmd>call emmet#expandAbbr(3,'')<cr>", "Emmet"}
-- lvim.builtin.which_key.mappings[","] = {'<cmd>!browser-sync start --server --files "*.js, *.html, *.css"<CR>', "Preview"}

-- Dashboard
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.footer = {"🐲"}
lvim.builtin.dashboard.custom_header = {
	"   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█",
	"    █  █▀     ▀  █   █      █  ██ █ █ █",
	"██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ",
	"█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ",
	"█  █ █ ▀███▀           █  █   ▐    █  ",
	"█   ██                  █▐        ▀   ",
	"                        ▐             ",
}

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

-- Nvim Tree
local tree_cb = require("nvim-tree.config").nvim_tree_callback
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.setup = {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = true,
	ignore_ft_on_setup = {},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = true,
		custom = { "*.exe", "*.o", "*.out" , "*.class"},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "<2-RightMouse>", "<C-}>", "e" }, cb = tree_cb("cd") },
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
}

-- Treesitter
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"java",
}

lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.disable = {"python"}

-- Lualine
lvim.builtin.lualine.enabled = true
lvim.builtin.lualine.style = "default"
lvim.builtin.lualine.options = {
	theme = "darkplus",
	disabled_filetypes = { "startify", "nerdtree", "term", "fugitive", "NvimTree", "toggleterm", "dashboard" },
	section_separators = { right = "", left = " " },
	component_separators = { left = "", right = "" },
}

local darkplus = {
	bg = "#282a36",
	bg1 = "#31353f",
	fg0 = "#000000",
	fg = "#abb2bf",
	blue = "#61afef",
	red = "#e86671",
	purple = "#c678dd",
	yellow = "#93691d",
}

lvim.builtin.lualine.options.theme = {
	normal = {
		b = { fg = darkplus.fg, bg = darkplus.bg1 },
		c = { fg = darkplus.fg, bg = darkplus.bg },
		a = { fg = darkplus.fg0, bg = darkplus.blue, gui = "bold" },
	},
	insert = {
		b = { fg = darkplus.fg, bg = darkplus.bg1 },
		c = { fg = darkplus.fg, bg = darkplus.bg },
		a = { fg = darkplus.fg0, bg = darkplus.red, gui = "bold" },
	},
	visual = {
		b = { fg = darkplus.fg, bg = darkplus.bg1 },
		c = { fg = darkplus.fg, bg = darkplus.bg },
		a = { fg = darkplus.fg0, bg = darkplus.purple, gui = "bold" },
	},
	replace = {
		b = { fg = darkplus.fg, bg = darkplus.bg1 },
		c = { fg = darkplus.fg, bg = darkplus.bg },
		a = { fg = darkplus.fg0, bg = darkplus.yellow, gui = "bold" },
	},
	inactive = {
		a = { fg = "NONE", bg = "NONE" },
		b = { fg = "NONE", bg = "NONE" },
		c = { fg = "NONE", bg = "NONE" },
	},
}

local components = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { "mode" }
lvim.builtin.lualine.sections.lualine_b = { components.filename }
lvim.builtin.lualine.sections.lualine_c = { components.diff, components.python_env }
lvim.builtin.lualine.sections.lualine_x = { components.diagnostics, components.lsp }
lvim.builtin.lualine.sections.lualine_y = { components.branch, components.progress }
lvim.builtin.lualine.sections.lualine_z = { components.location }
-- lvim.builtin.lualine.tabline = {
--   lualine_a = {{ "tabs", mode = 1 }}
-- }
lvim.builtin.bufferline.options = {
  always_show_bufferline = true,
  enforce_regular_tabs = false,

}

-- Additional Plugins
lvim.plugins = {
	{
		"tpope/vim-surround",
		-- keys = { "c", "d", "y" },
	},
	{
		"yong1le/darkplus.nvim",
	},
  {
    "mattn/emmet-vim",
  }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

-- generic LSP settings
lvim.lsp.automatic_servers_installation = false

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "stylua", filetypes = { "lua" } },
	{ command = "clang-format", filetypes = { "c++", "java" } },
	{
		command = "prettier",
		extra_args = { "--print-with", "100" },
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css", "json" },
	},
})

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
