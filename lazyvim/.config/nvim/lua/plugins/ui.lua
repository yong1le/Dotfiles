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
      overrides = function(_)
        return {
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
        }
      end,
    },
  },
  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_menu_selection_background = "yellow"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_visual = "red background"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_diagnostic_virtual_text = "highlight"
      vim.g.gruvbox_material_current_word = "grey background"
    end,
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
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
        options = {
          icons_enabled = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
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
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = function() return LazyVim.ui.fg("Constant") end,
            },
            -- stylua: ignore
            {
              function() return "  " .. require("dap").status() end,
              cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
              color = function() return LazyVim.ui.fg("Debug") end,
            },
            -- stylua: ignore
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = function() return LazyVim.ui.fg("Special") end,
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
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = {
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
      }

      opts.config.header = logo
    end,
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {
      create_autocmd = false,
    },
  },
}
