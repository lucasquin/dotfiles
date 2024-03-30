local M = {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
}

M.config = function()
  require("conform").setup {
    formatters_by_ft = {
      javascript = { "prettier_d" },
      typescript = { "prettier_d" },
      javascriptreact = { "prettier_d" },
      typescriptreact = { "prettier_d" },
      svelte = { "prettier_d" },
      css = { "prettier_d" },
      html = { "prettier_d" },
      json = { "prettier_d" },
      yaml = { "prettier_d" },
      markdown = { "markdownlint" },
      graphql = { "prettier_d" },
      lua = { "stylua" },
      go = { "gofumpt", "goimports" },
      sh = { "shfmt" }
    },
  }
end

return M
