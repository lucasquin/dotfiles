local M = {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
}

M.config = function()
  require("gitsigns").setup {
    current_line_blame = false,
  }
end

return M
