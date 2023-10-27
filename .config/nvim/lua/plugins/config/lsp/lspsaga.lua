local _, lspsaga = pcall(require, "lspsaga")
if not _ then
    return
end

lspsaga.setup({
    scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
    definition = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    finder = {
        keys = {
            edit = "<CR>",
            quit = { "q", "<ESC>" },
        },
    },
    ui = {
        sign = false,
    },
    symbol_in_winbar = {
        enable = false
    }
})
