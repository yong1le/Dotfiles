vim.o.relativenumber = true

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

--Terminal navigation
lvim.keys.term_mode["jk"] = "<C-\\><C-n>"
lvim.keys.term_mode["``"] = "<C-\\><C-n>:ToggleTerm<cr>"
lvim.keys.normal_mode["``"] = ":ToggleTerm<cr>"

-- Buffer Switching
lvim.keys.normal_mode["<TAB>"] = ":BufferNext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = ":BufferPrevious<cr>"


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

-- Whichkey
lvim.builtin.which_key.mappings["G"] = {"<cmd>TermExec cmd=\"lazygit\"<cr>", "Lazygit"}

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

lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true

-- Nvim Tree
local tree_cb = require "nvim-tree.config".nvim_tree_callback
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.setup = {
 disable_netrw = true,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  auto_close = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  update_to_buf_dir = {
    enable = true,
    auto_open = true
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = ""
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {}
  },
  system_open = {
    cmd = nil,
    args = {}
  },
  filters = {
    dotfiles = true,
    custom = {"*.exe", "*.o", "*.out"}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500
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
        {key = {"<2-RightMouse>", "<C-}>", "e"}, cb = tree_cb("cd")}
      }
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
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

-- Lualine
lvim.builtin.lualine.enabled = true
lvim.builtin.lualine.style = "lvim"

-- Additional Plugins
lvim.plugins = {
    {
      "tpope/vim-surround",
      keys = {"c", "d", "y"}
    }
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

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
