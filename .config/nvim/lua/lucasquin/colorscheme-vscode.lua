local M = {
  "Mofiqul/vscode.nvim",
}

M.config = function()
  require("vscode").setup {
    transparent = false,
    italic_comments = true,
    disable_nvimtree_bg = false,
  }
end

return M
