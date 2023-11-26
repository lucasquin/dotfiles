local lspzero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
local mason_null_ls = require("mason-null-ls")

-- LSP config

lspzero.on_attach(function(_, bufnr)
  lspzero.default_keymaps({ buffer = bufnr })
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format({
      bufnr = bufnr,
      filter = function(client)
        return client.name == "null-ls"
      end,
      timeout_ms = 8000,
    })
    print("File Formatted")
  end, { desc = "Format current buffer with LSP" })
end)

lspzero.set_preferences({
  sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " },
})

mason.setup()

mason_lspconfig.setup({
  automatic_installation = true,
  handlers = {
    lspzero.default_setup,
  },
  ensure_installed = { "lua_ls", "tsserver", "jsonls", "html", "cssls" },
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Formating & Linter

mason_null_ls.setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
  },
  automatic_installation = true,
})

local null_ls_utils = require("null-ls.utils")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
  sources = {
    formatting.stylua,
    formatting.prettier.with({
      extra_filetypes = { "svelte" },
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
      end,
    }),
    diagnostics.markdownlint,
    code_actions.gitsigns,
    code_actions.eslint_d,
  },
})
