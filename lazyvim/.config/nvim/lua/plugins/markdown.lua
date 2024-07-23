return {
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    opts = {},
    ft = "markdown",
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    event = {
      "BufReadPre " .. vim.fn.expand("~/Documents/Obsidian Vault/"),
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian Vault",
        },
      },
    },
  },
}
