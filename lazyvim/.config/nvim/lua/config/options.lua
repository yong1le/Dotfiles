vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.autoformat = true
vim.g.lazyvim_picker = "telescope"
vim.g.trouble_lualine = false -- trouble in default lualine

local opt = vim.opt

opt.autowrite = false
opt.expandtab = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.listchars = {
  tab = "│→",
  extends = "⟩",
  precedes = "⟨",
  trail = "·",
  nbsp = "␣",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
  opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  opt.foldmethod = "expr"
  opt.foldtext = ""
else
  opt.foldmethod = "indent"
  opt.foldtext = "v:lua.require'lazyvim.util'.ui.foldtext()"
end

local lsp = vim.lsp
