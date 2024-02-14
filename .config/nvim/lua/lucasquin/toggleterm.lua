local M = { "akinsho/toggleterm.nvim", version = "*", config = true }

M.config = function()
  require("toggleterm").setup {
    shell = "/usr/bin/zsh",
    open_mapping = [[<C-t>]],
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    highlights = {
      Normal = {
        link = "Normal",
      },
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        link = "FloatBorder",
      },
      SignColumn = {
        link = "EndOfBuffer",
      },
      EndOfBuffer = {
        link = "EndOfBuffer",
      },
    },
    float_opts = {
      border = "rounded",
    },
    persist_size = true,
    persist_mode = true,
    autochdir = true,
  }
end

return M
