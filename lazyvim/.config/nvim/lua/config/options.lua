vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.autoformat = true
vim.g.lazyvim_picker = "snacks"
vim.g.trouble_lualine = false

local opt = vim.opt

opt.autowrite = false
opt.expandtab = true
opt.updatecount = 200

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.g.lazyvim_statuscolumn = {
  folds_open = true,
  folds_githl = true,
}

opt.listchars = {
  tab = "│→",
  extends = "⟩",
  precedes = "⟨",
  trail = "",
  nbsp = "␣",
}
opt.foldlevel = 99
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.termsync = true

if vim.g.neovide then
  vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)
  vim.g.snacks_animate = false
  vim.g.neovide_cursor_animation_length = 0
end
