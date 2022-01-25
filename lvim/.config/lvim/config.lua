-- Options
vim.o.sidescrolloff = 8
vim.o.relativenumber = true

-- general
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.transparent_window = true
lvim.colorscheme = "darkplus"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

-- Terminal Navigation
lvim.keys.term_mode["jk"] = "<C-\\><C-n>"
lvim.keys.term_mode["<space>t"] = "<C-c><C-\\><C-n>:ToggleTerm<cr>"
lvim.keys.normal_mode["<space>t"] = ":ToggleTerm<cr>"

-- Buffer Switching
lvim.keys.normal_mode["<TAB>"] = ":BufferNext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferPrevious<cr>"

-- Lsp
lvim.keys.normal_mode["ca"] = ":Lspsaga code_action<cr>"
lvim.keys.normal_mode["K"] = ":Lspsaga hover_doc<cr>"
lvim.keys.normal_mode["gr"] = ":Telescope lsp_references<cr>"
lvim.keys.normal_mode["gi"] = ":Telescope lsp_implementations<cr>"

-- Running code
_G.run_code = function()
	local ft = vim.api.nvim_buf_get_option(0, "filetype")

	local t = function(str)
		return vim.api.nvim_replace_termcodes(str, true, true, true)
	end
	if ft == "python" then
		return ":w | TermExec cmd='python3 %'" .. t("<CR>")
	elseif ft == "java" then
		return ":w | TermExec cmd='javac % && java %'" .. t("<CR>")
	elseif ft == "javascript" then
		return ":w | TermExec cmd='node %'" .. t("<CR>")
	elseif ft == "cpp" then
		return ":w | TermExec cmd='g++ -o %:r.o % && %:r.o'" .. t("<CR>")
	elseif ft == "lua" then
		return ":w | luafile %" .. t("<CR>")
	else
		return ":w" .. t("<CR>")
	end
end

vim.api.nvim_set_keymap("n", "<space>r", "v:lua.run_code()", { expr = true })

lvim.builtin.terminal.close_on_exit = true
-- Whichkey
lvim.builtin.which_key.mappings["b"] = {
	name = "+Buffers",
	d = { "<cmd>BufferDelete<cr>", "Delete Buffer" },
}
lvim.builtin.which_key.mappings["G"] = {"<cmd>TermExec cmd=\"lazygit\"<cr>", "Lazygit"}
lvim.builtin.which_key.mappings["l"] = {
	name = "+LSP",
	a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
	A = { "<cmd>Lspsaga range_code_action<cr>", "Selected Action" },
	d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
	D = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
	f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format" },
	I = { "<cmd>LspInfo<cr>", "Lsp Info" },
	L = { "<cmd>Lspsaga lsp_finder<cr>", "Lsp Finder" },
	l = { "<cmd>Lspsaga show_line_diagnostics<cr>", "Line Diagnostics" },
	p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
	r = { "<cmd>Lspsaga rename<cr>", "Rename" },
	R = { "<cmd>LspRestart<cr>", "Restart" },
	s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
	S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbols" },
}
lvim.builtin.which_key.mappings[","] = { "<cmd>call emmet#expandAbbr(3,'')<cr>", "Emmet" }

-- Dashboard
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.custom_header = {
	"   ▄   ▄███▄   ████▄     ▄   ▄█ █▀▄▀█",
	"    █  █▀     ▀  █   █      █  ██ █ █ █",
	"██   █ ██▄▄    █   █ █     █ ██ █ ▄ █ ",
	"█ █  █ █▄   ▄▀ ▀████  █    █ ▐█ █   █ ",
	"█  █ █ ▀███▀           █  █   ▐    █  ",
	"█   ██                  █▐        ▀   ",
	"                        ▐             ",
}

-- Terminal
lvim.builtin.terminal.active = true
lvim.builtin.terminal.close_on_exit = false

-- Nvimtree
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.enable = false

lvim.builtin.lualine.enabled = false
lvim.builtin.lualine.style = "lvim"
lvim.builtin.lualine.sections.lualine_x = { "location", "encoding", "fileformat", "filetype" }
lvim.builtin.lualine.options.component_separators = { "", "" }
lvim.builtin.lualine.options.section_separators = { "", "" }

-- Additional Plugins
lvim.plugins = {
	{ "yong1le/darkplus.nvim" },
	{
		"tpope/vim-surround",
		keys = { { "n", "cs" }, { "n", "ys" }, { "n", "ds" }, { "v", "S" } },
	},
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").init_lsp_saga({
				code_action_icon = "",
				error_sign = "",
				warn_sign = "",
				hint_sign = "",
				infor_sign = "",
				border_style = "round",
			})
		end,
		event = "BufReadPre",
	},
	{
		"folke/todo-comments.nvim",
		event = "BufReadPre",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		run = "npm install --prefix server",
	},
	{
		"mattn/emmet-vim",
		ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	{
		"tamton-aquib/staline.nvim",
		config = function()
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "branch", " ", "lsp" },
					mid = {"file_name"},
					right = { "lsp_name", "  ", "line_column" },
				},
				mode_colors = {
					i = "#d4be98",
					n = "#84a598",
					c = "#8fbf7f",
					v = "#fc802d",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = " ",
				},
			})
		end,
	},
}
