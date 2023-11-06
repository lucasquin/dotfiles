local _, luasnip = pcall(require, "luasnip")
if not _ then
	return
end

require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load()
