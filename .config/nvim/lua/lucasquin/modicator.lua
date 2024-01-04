local M = {
  "mawkler/modicator.nvim",
  dependencies = "folke/tokyonight.nvim",
}

M.config = function()
  require("modicator").setup {
    show_warnings = true,
    highlights = {
      defaults = {
        bold = true,
        italic = true,
      },
    },
    integration = {
      lualine = {
        enabled = true,
        mode_section = nil,
        highlight = "bg",
      },
    },
  }
end

return M
