local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring"
  }
}

M.config = function()
  vim.g.skip_ts_context_commentstring_module = true
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline" },
    ignore_install = { "" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local _, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if _ and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = true,
    },
    indent = { enable = false },
  }
end

return M
