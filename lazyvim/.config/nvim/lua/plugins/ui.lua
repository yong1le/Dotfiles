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
              function()
                return require("noice").api.status.mode.get()
              end,
              cond = function()
                return package.loaded["noice"] and require("noice").api.status.mode.has()
              end,
              color = function()
                return { fg = Snacks.util.color("Constant") }
              end,
            },
            {
              function()
                return "  " .. require("dap").status()
              end,
              cond = function()
                return package.loaded["dap"] and require("dap").status() ~= ""
              end,
              color = function()
                return { fg = Snacks.util.color("Debug") }
              end,
            },
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
  {
    "folke/edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
      bottom = {
        {
          ft = "snacks_terminal",
          size = { height = 0.3 },
          title = "%{b:snacks_terminal.id}: %{b:term_title}",
          filter = function(_, win)
            return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == "bottom"
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        },
        {
          ft = "dap-repl",
          title = "REPL",
          size = { height = 0.2 },
        },
        {
          ft = "dapui_console",
          title = "Console",
          size = { height = 0.2 },
        },
      },
      right = {
        {
          ft = "dapui_scopes",
          title = "Scope",
          size = { width = 0.2 },
        },
        {
          ft = "dapui_breakpoints",
          title = "Breakpoints",
          size = { width = 0.2 },
        },
        {
          ft = "dapui_stacks",
          title = "Stacks",
          size = { width = 0.2 },
        },
        {
          ft = "dapui_watches",
          title = "Expressions",
          size = { width = 0.2 },
        },
        { title = "Grug Far", ft = "grug-far", size = { width = 0.2 } },
        { title = "Code Companion", ft = "codecompanion", size = { width = 0.2 } },
      },
    },
  },
}
