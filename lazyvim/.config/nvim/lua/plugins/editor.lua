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
}
