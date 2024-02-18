local M = {
  "neovim/nvim-lspconfig",
}

M.config = function()
  local lspconfig = require "lspconfig"

  local servers = { "cmake", "cssmodules_ls", "clangd", "gopls", "templ", "bashls", "marksman", "yamlls", "dockerls",
    "docker_compose_language_service", "tailwindcss", "vimls", "tsserver" }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {}
  end

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  servers = { "cssls", "html", "jsonls" }
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities,
    }
  end

  lspconfig.svelte.setup({
    root_dir = lspconfig.util.root_pattern("svelte.config.cjs", "svelte.config.js"),
  })

  lspconfig.ltex.setup {
    settings = {
      ltex = {
        language = { "en-US" },
        enabled = { "bibtex", "gitcommit", "markdown", "org", "tex", "restructuredtext", "rsweave", "latex", "quarto", "rmd", "context" }
      },
    },
  }

  lspconfig.lua_ls.setup {
    on_init = function(client)
      local path = client.workspace_folders[1].name
      if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
          Lua = {
            runtime = {
              version = 'LuaJIT'
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
              }
            }
          }
        })

        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
      end
      return true
    end
  }
end

return M
