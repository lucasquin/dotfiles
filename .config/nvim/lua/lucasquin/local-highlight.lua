local M = {
  "tzachar/local-highlight.nvim",
  event = "VeryLazy",
}

M.config = function()
  require("local-highlight").setup {
    disable_file_types = { "neo-tree" },
    hlgroup = "Search",
    cw_hlgroup = nil,
  }
end

return M
