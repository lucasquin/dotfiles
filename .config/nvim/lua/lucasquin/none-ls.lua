local M = {
  "nvimtools/none-ls.nvim",
}

M.config = function()
  local null_ls = require "null-ls"
  local f = null_ls.builtins.formatting
  local d = null_ls.builtins.diagnostics
  local c = null_ls.builtins.code_actions

  null_ls.setup {
    sources = {
      -- lua
      f.stylua,

      -- git
      c.gitsigns,

      -- javascript world
      f.prettier.with {
        extra_filetypes = { "toml" },
      },
      d.eslint,

      -- shell
      f.shfmt,
      d.shellcheck,
      c.shellcheck,

      -- golang
      f.gofumpt,
      f.goimports,
      f.goimports_reviser,
      f.golines,
      c.gomodifytags,
      c.impl,
    },
  }
end

return M
