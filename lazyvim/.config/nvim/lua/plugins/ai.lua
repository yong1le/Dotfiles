return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                default = "claude-sonnet-4",
              },
            },
          })
        end,
      },
      display = {
        chat = {
          window = {
            width = 0.25,
          },
        },
      },
    },
    keys = {
      { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
      {
        "<leader>aa",
        ":CodeCompanionChat Toggle<cr>",
        desc = "AI Chat",
        mode = { "n", "v" },
        silent = true,
      },
      {
        "<leader>ai",
        ":CodeCompanion<cr>",
        desc = "AI Inline",
        mode = { "n", "v" },
        silent = true,
      },
      {
        "<leader>af",
        ":'<,'>CodeCompanion /fix<cr>",
        desc = "Fix Code",
        mode = { "v" },
        silent = true,
      },
      {
        "<leader>ad",
        ":'<,'>CodeCompanion /lsp<cr>",
        desc = "Explain Diagnostics",
        mode = { "v" },
        silent = true,
      },
    },
  },
}
