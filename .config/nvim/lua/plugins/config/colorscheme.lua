local _, dracula = pcall(require, "dracula")
if not _ then
    return
end

dracula.setup({
    show_end_of_buffer = true,
    transparent_bg = true,
    lualine_bg_color = nil,
    italic_comment = true,
    overrides = {},
})

local _, transparent = pcall(require, "transparent")
if not _ then
    return
end

transparent.setup({
    groups = {
        'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
        'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
        'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
        'SignColumn', 'CursorLineNr', 'EndOfBuffer',
    },
    extra_groups = {
        "NormalFloat",
        "NeoTreeNormal"
    },
    exclude_groups = {},
})
