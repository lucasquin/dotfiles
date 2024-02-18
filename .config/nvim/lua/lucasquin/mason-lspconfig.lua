local M = {
  "williamboman/mason-lspconfig.nvim",
}

M.config = function()
  require("mason-lspconfig").setup {
    ensure_installed = {
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
      "tsserver"
    },
    automatic_installation = false,
  }
end

return M
