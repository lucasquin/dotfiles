local M = {
  "Mofiqul/dracula.nvim",
}

M.config = function()
  require("dracula").setup {
    show_end_of_buffer = false,
    transparent_bg = true,
    lualine_bg_color = nil,
    italic_comment = true,
    overrides = {
      NeoTreeNormal = { fg = "#F8F8F2", bg = "#191A21" },
      NeoTreeNormalNC = { fg = "#F8F8F2", bg = "#191A21" },
      NeoTreeDimText = { fg = "#F8F8F2" },
      TelescopeNormal = { bg = "#191A21", fg = "#F2F2F2" },
    },
  }
  vim.cmd.colorscheme "dracula"
end

return M
