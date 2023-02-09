-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "tokyonight-storm"
vim.o.relativenumber = true
vim.o.timeoutlen = 300
vim.o.guifont = "FiraCode Nerd Font:h14"

-- neovide
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_remember_window_size = true
vim.g.neovide_input_macos_alt_is_meta = true
vim.g.neovide_background_color = "#282d44"


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["<tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.insert_mode["jk"] = "<esc>"

-- window resizing
lvim.keys.normal_mode["<M-h>"] = ":vertical resize -2<CR>"
lvim.keys.normal_mode["<M-j>"] = ":resize -2<CR>"
lvim.keys.normal_mode["<M-k>"] = ":resize +2<CR>"
lvim.keys.normal_mode["<M-l>"] = ":vertical resize +2<CR>"
-- for terminal
lvim.keys.term_mode["<M-h>"] = "<C-\\><C-n>:vertical resize -2<CR>"
lvim.keys.term_mode["<M-j>"] = "<C-\\><C-n>:resize -2<CR>"
lvim.keys.term_mode["<M-k>"] = "<C-\\><C-n>:resize +2<CR>"
lvim.keys.term_mode["<M-l>"] = "<C-\\><C-n>:vertical resize +2<CR>"

lvim.keys.term_mode["jk"] = "<C-\\><C-n>esc"
lvim.keys.term_mode["<C-`>"] = "<C-c><C-\\><C-n>:ToggleTerm<cr>"
lvim.keys.term_mode["<C-l>"] = "<C-l>"
lvim.keys.normal_mode["<C-`>"] = ":ToggleTerm<cr>"


-- VimTex
vim.g.vimtex_view_method = 'skim'

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
  elseif ft == "cpp" then
    return ":w | TermExec cmd='g++ -o \"%:p:r.o\" \"%:p\" && \"%:p:r.o\"' go_back=0" .. t("<CR>")
  elseif ft == "c" then
    return ":w | TermExec cmd='gcc -Wall -std=c99 -o \"%:p:r.o\" \"%:p\" && \"%:p:r.o\"' go_back=0" .. t("<CR>")
  elseif ft == "tex" then
    return ":w | VimtexCompile" .. t("<CR>")
  elseif ft == "sql" then
    return ":w | cd %:h | TermExec cmd='sqlite3 Test.db < \"%\"' go_back=0" .. t("<CR>") .. "rm Test.db" .. t("<CR>")
  else
    return ":w" .. t("<CR>")
  end
end

vim.api.nvim_set_keymap("n", "<space>r", "v:lua.run_code()", { expr = true })
lvim.builtin.which_key.mappings["r"] = { "Run Code" }

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.alpha.dashboard.section.header.val = {"Neovim"}

lvim.builtin.alpha.dashboard.section.footer.val = {"Hello"}
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.view.mappings.list = {
  { key = "u", action = "dir_up" },
  { key = "e", action = "cd" },
}
lvim.builtin.nvimtree.setup.filters.custom = {"*.out", "*.o", ".DS_Store", "*.class", ".vscode", "__pycache__", ".school"}
lvim.builtin.project.patterns = { ".school" }

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true



-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.installer.setup.ensure_installed = {
  "sumneko_lua",
  "jsonls",
}
lvim.lsp.diagnostics.virtual_text = false

lvim.lsp.installer.setup.automatic_installation = true

-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "yapf", filetypes = { "python" } },
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact" },
  },
  -- { command = "clang-format", filetypes = { "c", "cpp" } },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "shellcheck",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    extra_args = { "--severity", "warning" },
  },
  -- {
  --   command = "codespell",
  --   ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --   filetypes = { "javascript", "python" },
  -- },
}

-- Additional Plugins
lvim.plugins = {
  {
    "kylechui/nvim-surround",
    -- tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },
  -- {
  --   'jakewvincent/texmagic.nvim',
  --   config = function()
  --     require('texmagic').setup({
  --       -- Config goes here; leave blank for defaults
  --     })
  --   end
  -- }
  -- {
  --   "andweeb/presence.nvim",
  -- },
  {
    "lervag/vimtex"
  },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
