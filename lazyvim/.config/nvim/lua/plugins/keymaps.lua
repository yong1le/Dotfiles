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
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
        end

        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function()
          gs.nav_hunk("last")
        end, "Last Hunk")
        map("n", "[H", function()
          gs.nav_hunk("first")
        end, "First Hunk")

        map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gp", gs.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>gl", function()
          gs.blame_line({ full = true })
        end, "Blame Line")
        map("n", "<leader>gb", function()
          gs.blame()
        end, "Blame Buffer")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },
  {
    "utilyre/barbecue.nvim",
    keys = {
      { "<leader>uB", "<cmd>Barbecue toggle<cr>", desc = "Toggle Breadcrumbs" },
    },
  },
}
