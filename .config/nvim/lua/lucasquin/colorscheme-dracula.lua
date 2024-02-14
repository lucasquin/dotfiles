local M = {
  "Mofiqul/dracula.nvim",
}

M.config = function()
  require("dracula").setup {
    show_end_of_buffer = false,
    transparent_bg = true,
    lualine_bg_color = true,
    italic_comment = true,
  }
  vim.cmd.colorscheme "dracula"
end

return M
