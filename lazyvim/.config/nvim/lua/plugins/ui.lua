return {
  {
    "rebelot/kanagawa.nvim",
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = false,
      terminalColors = true,
      colors = {
        palette = {},
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      overrides = function(colors)
        local theme = colors.theme

        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },

          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          WinSeparator = { fg = theme.ui.special, bg = "none" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-dragon",
    },
  },
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

      local git_icons = LazyVim.config.icons.git
      local diagnostics_icons = LazyVim.config.icons.diagnostics

      return {
        refresh = {
          winbar = 1,
        },
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "neotree", "neo-tree" } },
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
            "branch",
          },
          lualine_c = {
            {
              "filetype",
              icon_only = true,
              separator = "",
              padding = { left = 1, right = 0 },
            },
            "filename",
            {
              "diff",
              symbols = {
                added = git_icons.added,
                modified = git_icons.modified,
                removed = git_icons.removed,
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_lsp", "nvim_diagnostic" },
              symbols = {
                error = diagnostics_icons.Error,
                warn = diagnostics_icons.Warn,
                info = diagnostics_icons.Info,
                hint = diagnostics_icons.Hint,
              },
            },
            Snacks.profiler.status(),
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function()
                return { fg = Snacks.util.color("Special") }
              end,
            },
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
