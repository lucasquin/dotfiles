local M = {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
  ft = "gitcommit",
}

M.config = function()
  require("gitsigns").setup {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "▎" },
      topdelete = { text = "契" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
  }
end

return M
