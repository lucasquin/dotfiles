local M = {
  "VidocqH/auto-indent.nvim",
}

M.config = function()
  require("auto-indent").setup {
    lightmode = true,
    indentexpr = nil,
    ignore_filetype = {},
  }
end

return M
