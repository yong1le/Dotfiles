return {
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = { "gr", "<cmd>Trouble lsp_references<cr>", desc = "Goto Definition" }
      keys[#keys + 1] = { "gI", "<cmd>Trouble lsp_implementations<cr>", desc = "Goto Implementation" }
      keys[#keys + 1] = { "gd", "<cmd>Trouble lsp_definitions<cr>", desc = "Goto Definition" }
      keys[#keys + 1] = { "gD", "<cmd>Trouble lsp_declarations<cr>", desc = "Goto Declaration" }
      keys[#keys + 1] = { "gy", "<cmd>Trouble lsp_type_definitions<cr>", desc = "Goto Type Definition" }
      keys[#keys + 1] = { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Show Line Diagnostics" }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>E",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>fe", false },
      { "<leader>fE", false },
      { "<leader>ge", false },
      { "<leader>be", false },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader><space>", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
      { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>sw", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      { "<leader>sW", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      { "<leader>sd", false }, -- file diagnostics
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
      { "<leader>sD", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Diagnostics" },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      focus = true,
    },
    keys = {
      { "<leader>sd", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>st", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,HACK,FIXME,BUG,NOTE<cr>", desc = "Todo" },
      { "<leader>xx", false },
      { "<leader>xX", false },
      { "<leader>cs", false },
      { "<leader>xL", false },
      { "<leader>xQ", false },
      { "<leader>xT", false },
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
}
