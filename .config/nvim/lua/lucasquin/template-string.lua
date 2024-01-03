local M = {
  "axelvc/template-string.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
}

M.config = function()
  require("template-string").setup {
    filetypes = { "html", "typescript", "javascript", "typescriptreact", "javascriptreact", "python" },
    jsx_brackets = true,
    remove_template_string = false,
    restore_quotes = {
      normal = [[']],
      jsx = [["]],
    },
  }
end

return M
