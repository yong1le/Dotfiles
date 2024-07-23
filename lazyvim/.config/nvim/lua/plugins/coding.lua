return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        astro = { "eslint_d" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        astro = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function() end,
  },
  {

    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "cssls",
        "html",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
        ["cssls"] = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true

          require("lspconfig").cssls.setup({
            capabilities = capabilities,
          })
        end,
      },
    },
  },
}
