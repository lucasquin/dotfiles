local _, auto_indent = pcall(require, "auto-indent")
if not _ then
	return
end

auto_indent.setup({
	lightmode = true,
	indentexpr = nil,
	ignore_filetype = {},
})
