local M = {
  "Mofiqul/dracula.nvim",
}

M.config = function()
  require("dracula").setup {
    show_end_of_buffer = true,
    transparent_bg = false,
    lualine_bg_color = nil,
    italic_comment = true,
  }
  vim.cmd.colorscheme "dracula"
end

return M
