local M = {
  "folke/tokyonight.nvim",
}

M.config = function()
  require("tokyonight").setup {
    style = "storm",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "transparent",
    },
    sidebars = { "qf", "help" },
    day_brightness = 0.3,
    hide_inactive_statusline = true,
    dim_inactive = false,
    lualine_bold = true,
  }

end

return M
