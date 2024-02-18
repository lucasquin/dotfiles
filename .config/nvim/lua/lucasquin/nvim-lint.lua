local M = {
  "mfussenegger/nvim-lint",
}

M.config = function()
  require("lint").linters_by_ft = {
    go = { "golangcilint" },
    markdown = { "markdownlint" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    json = { "jsonlint" },
  }

  vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return M
