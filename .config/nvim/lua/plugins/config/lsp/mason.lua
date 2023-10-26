local _, lspzero = pcall(require, "lsp-zero")
if not _ then
    return
end

lspzero.on_attach(function(client, bufnr)
  lspzero.default_keymaps({buffer = bufnr})
end)

lspzero.set_preferences({
    sign_icons = { error = " ", warn = " ", hint = "ﴞ ", info = " " }
})

local _, mason = pcall(require, "mason")
if not _ then
    return
end

mason.setup()

local _, mason_lspconfig = pcall(require, "mason-lspconfig")
if not _ then
    return
end

mason_lspconfig.setup({
    automatic_installation = true,
      handlers = {
    lspzero.default_setup,
  }
})

local _, mason_null_ls = pcall(require, "mason-null-ls")
if not _ then
    return
end

mason_null_ls.setup({
    automatic_installation = true,
})
