local _, lspzero = pcall(require, "lsp-zero")
if not _ then
	return
end

local _, mason = pcall(require, "mason")
if not _ then
	return
end

local _, mason_lspconfig = pcall(require, "mason-lspconfig")
if not _ then
	return
end

local _, lspconfig = pcall(require, "lspconfig")
if not _ then
	return
end

local _, null_ls = pcall(require, "null-ls")
if not _ then
	return
end

local _, mason_null_ls = pcall(require, "mason-null-ls")
if not _ then
	return
end

--
-- LSP config
--

lspzero.on_attach(function(_, bufnr)
	lspzero.default_keymaps({ buffer = bufnr })
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				return client.name == "null-ls"
			end,
			timeout_ms = 8000
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

--
-- Formating & Linter
--

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
		null_ls.builtins.completion.spell,
		code_actions.gitsigns,
		code_actions.eslint_d,
	},
})
