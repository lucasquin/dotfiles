local tokyonight = require("tokyonight")

tokyonight.setup({
  style = "storm",
  light_style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    sidebars = "dark",
    floats = "dark",
  },
  sidebars = { "qf", "help" },
  day_brightness = 0.3,
  hide_inactive_statusline = false,
  dim_inactive = false,
  lualine_bold = true,
})

local dracula = require("dracula")

dracula.setup({
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
})

local vscode = require("vscode")

vscode.setup({
  transparent = true,
  italic_comments = true,
  disable_nvimtree_bg = true,
})
