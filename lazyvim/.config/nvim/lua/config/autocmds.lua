-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({
  "WinScrolled",
  "BufWinEnter",
  "CursorHold",
  "InsertLeave",
  "BufModifiedSet",
}, {
  group = vim.api.nvim_create_augroup("barbecue.updater", {}),
  callback = function()
    require("barbecue.ui").update()
  end,
})

vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  command = "silent !zellij action switch-mode normal",
})
