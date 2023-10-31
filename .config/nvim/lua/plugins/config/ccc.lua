local _, ccc = pcall(require, "ccc")
if not _ then
	return
end

local mapping = ccc.mapping

ccc.setup({
	highlighter = {
		auto_enable = true,
		lsp = true,
	},
})

