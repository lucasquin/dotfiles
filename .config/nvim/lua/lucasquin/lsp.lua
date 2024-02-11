local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "VonHeikemen/lsp-zero.nvim",
      {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
          "williamboman/mason.nvim",
          "nvim-lua/plenary.nvim",
        },
      },
    },
  },
}

M.config = function()
  local lsp_zero = require "lsp-zero"

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = {
      "lua_ls",
      "cssls",
      "html",
      "tsserver",
      "bashls",
      "jsonls",
      "yamlls",
      "marksman",
    },
    handlers = {
      lsp_zero.default_setup,

      lua_ls = function()
        local lua_opts = lsp_zero.nvim_lua_ls()
        require("lspconfig").lua_ls.setup(lua_opts)
      end,
    },
    automatic_installation = true,
  }

end

return M
