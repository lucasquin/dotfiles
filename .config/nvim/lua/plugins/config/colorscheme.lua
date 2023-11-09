local _, tokyonight = pcall(require, "tokyonight")
if not _ then
	return
end

tokyonight.setup({
	style = "storm",
	light_style = "day",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help" },
	day_brightness = 0.3,
	hide_inactive_statusline = false,
	dim_inactive = false,
	lualine_bold = true,
})

local _, dracula = pcall(require, "dracula")
if not _ then
	return
end

dracula.setup({
	show_end_of_buffer = true,
	transparent_bg = false,
	lualine_bg_color = "#44475a",
	italic_comment = true,
})

