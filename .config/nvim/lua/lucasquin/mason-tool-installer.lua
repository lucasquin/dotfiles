local M = {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
}

M.config = function()
  require("mason-tool-installer").setup {
    ensure_installed = {
      -- LSP
      "lua_ls",
      "svelte",
      "cssls",
      "html",
      "jsonls",
      "cmake",
      "cssmodules_ls",
      "clangd",
      "gopls",
      "templ",
      "bashls",
      "marksman",
      "yamlls",
      "dockerls",
      "docker_compose_language_service",
      "ltex",
      "tailwindcss",
      "vimls",
      "tsserver",

      -- Linters
      "golangci-lint",
      "markdownlint",
      "eslint_d",
      "jsonlint",

      -- Formatters
      "prettierd",
      "stylua",
      "goimports",
      "golines",

      -- Debug Adapters
      "delve",
    },
    auto_update = false,
    run_on_start = true,
  }
end

return M
