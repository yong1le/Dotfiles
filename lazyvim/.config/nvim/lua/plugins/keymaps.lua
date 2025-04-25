return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show Line Diagnostics" }
    end,
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>sg", false }, -- live grep (root), mapped to sW
      { "<leader>sG", false }, -- live grep (cwd), mapped to sw
      { "<leader>sa", false }, -- autocmd
      { "<leader>sb", false }, -- current buffer fzf
      { "<leader>sC", false }, -- commands
      { "<leader>sh", false }, -- help pages
      { "<leader>sH", false }, -- highlight groups
      { "<leader>sk", false }, -- keymaps
      { "<leader>sM", false }, -- man pages
      { "<leader>so", false }, -- options
      { "<leader>sq", false }, -- quickfix list
      { "<leader>gs", false }, -- git statuses
      { "<leader>,", LazyVim.pick("buffers"), desc = "Find Buffers" },
      { "<leader><space>", LazyVim.pick("buffers"), desc = "Find Buffers" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files" },
      { "<leader>fF", LazyVim.pick("files", { no_ignore = true, root = false }), desc = "Find All Files" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>sw", LazyVim.pick("live_grep", { root = false }), desc = "Find Words" },
      { "<leader>sd", LazyVim.pick("diagnostics"), desc = "Diagnostics" },
    },
  },
  {
    "utilyre/barbecue.nvim",
    keys = {
      { "<leader>uB", "<cmd>Barbecue toggle<cr>", desc = "Toggle Breadcrumbs" },
    },
  },
}
