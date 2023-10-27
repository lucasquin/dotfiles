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

local _, null_ls = pcall(require, "null-ls")
if not _ then
	return
end

local _, mason_null_ls = pcall(require, "mason-null-ls")
if not _ then
	return
end

lspzero.on_attach(function(_, bufnr)
	lspzero.default_keymaps({ buffer = bufnr })
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(client)
				return client.name == "null-ls"
			end,
		})
		print("File formatted")
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

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
	},
})

mason_null_ls.setup({
	ensure_installed = { "stylua", "prettierd" },
	automatic_installation = true,
})
