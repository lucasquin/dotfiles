local M = {
  "Mofiqul/dracula.nvim",
}

M.config = function()
  require("dracula").setup {
    show_end_of_buffer = false,
    transparent_bg = false,
    lualine_bg_color = false,
    italic_comment = true,
  }
  vim.cmd.colorscheme "dracula"
end

return M
