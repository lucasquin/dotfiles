local M = {
  "nvimdev/lspsaga.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}

M.config = function()
  local lspsaga = require "lspsaga"

  lspsaga.setup {
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
      keys = {
        edit = "<CR>",
        quit = { "q", "<ESC>" },
      },
    },
    finder = {
      keys = {
        edit = "<CR>",
        quit = { "q", "<ESC>" },
      },
    },
    ui = {
      sign = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
  }
end

return M
