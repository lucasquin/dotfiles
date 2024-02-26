local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("lualine").setup {
    options = {
      theme = "auto",
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = nil }, right_padding = 0 },
      },
      lualine_b = { "filename", "branch" },
      lualine_c = { "fileformat" },
      lualine_x = {nil},
      lualine_y = { "filetype", "progress" },
      lualine_z = {
        { "location", separator = { right = nil }, left_padding = 0 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
  }
end

return M
