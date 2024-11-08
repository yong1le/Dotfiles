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
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local themes = require("telescope.themes")
      local actions = require("telescope.actions")

      opts = vim.tbl_deep_extend("force", opts, {
        defaults = themes.get_ivy({
          prompt_prefix = "  ",
          selection_caret = " ",
          multi_icon = "󰒅 ",
          layout_config = {
            preview_cutoff = 1,
          },
          hidden = true,
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
            n = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-f>"] = actions.preview_scrolling_down,
              ["<C-b>"] = actions.preview_scrolling_up,
            },
          },
        }),
        pickers = {
          buffers = {
            mappings = {
              i = {
                ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
              },
            },
          },
        },
      })

      return opts
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts = vim.tbl_deep_extend("force", opts, {
        mapping = {
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
        },
      })

      return opts
    end,
  },
}
