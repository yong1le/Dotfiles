return {
  {
    "max397574/better-escape.nvim",
    event = { "VeryLazy" },
    opts = {
      mappings = {
        t = {
          j = {
            k = false,
            j = false,
          },
        },
      },
    },
  },
  {
    "dynamotn/Navigator.nvim",
    event = "VeryLazy",
    cmd = {
      "NavigatorLeft",
      "NavigatorDown",
      "NavigatorUp",
      "NavigatorRight",
      "NavigatorPrevious",
    },
    opts = {},
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      preset = "modern",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Terminal", mode = { "n", "i", "v", "t" } },
      { "<leader>ft", "<cmd>TermSelect<cr>", desc = "Terminals" },
    },
    opts = {
      shade_terminals = false,
      open_mapping = [[<c-/>]],
      winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
          return "Terminal " .. term.id
        end,
      },
    },
  },
}
