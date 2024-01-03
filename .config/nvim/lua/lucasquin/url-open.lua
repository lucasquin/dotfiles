local M = {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
}

M.config = function()
  require("url-open").setup {
    open_app = "default",
    open_only_when_cursor_on_url = false,
    highlight_url = {
      all_urls = {
        enabled = false,
        fg = "#21d5ff",
        bg = nil,
        underline = true,
      },
      cursor_move = {
        enabled = false,
        fg = "#199eff",
        bg = nil,
        underline = true,
      },
    },
    deep_pattern = false,
  }
end

return M
