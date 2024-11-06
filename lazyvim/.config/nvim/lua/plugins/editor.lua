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
    "numToStr/Navigator.nvim",
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
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local themes = require("telescope.themes")

      opts.defaults = themes.get_ivy({
        layout_config = {
          preview_cutoff = 1,
        },
        hidden = false,
      })
    end,
  },
}
