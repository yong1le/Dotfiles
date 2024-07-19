return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function()
      -- Getting attached lsp clients
      local mode_icons = {
        ["NORMAL"] = "",
        ["O-PENDING"] = "󰥔",
        ["VISUAL"] = "󰆐",
        ["V-LINE"] = "󰆐",
        ["V-BLOCK"] = "󰆐",
        ["SELECT"] = "󰌇",
        ["S-LINE"] = "󰌇",
        ["S-BLOCK"] = "󰌇",
        ["INSERT"] = "󰏫",
        ["REPLACE"] = "󰛔",
        ["V-REPLACE"] = "󰛔",
        ["COMMAND"] = "󰘳",
        ["EX"] = "󰘳",
        ["MORE"] = "",
        ["CONFIRM"] = "",
        ["SHELL"] = "",
        ["TERMINAL"] = "",
      }

      return {
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return mode_icons[str]
              end,
            },
          },
          lualine_b = {
            "filename",
          },
          lualine_c = {
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = "󱨇 ", removed = " " },
            },
            "filetype",
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_lsp", "nvim_diagnostic" },
            },
            "searchcount",
          },
          lualine_y = {
            "location",
          },
          lualine_z = {
            "progress",
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "branch" },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
