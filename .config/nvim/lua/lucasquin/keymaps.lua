local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>", "", opts)

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Navegação entre janelas
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-j>", "<C-w>j", opts)

-- Salvar
map("n", "<C-s>", "<cmd>w<cr><esc>", opts)

-- Salvar tudo
map("n", "<C-S-s>", "<cmd>wa<cr><esc>", opts)

-- Selecionar tudo
map("n", "<C-a>", "ggVG", opts)

-- Mover linhas no modo normal
map("n", "<A-k>", "<cmd>MoveLine(-1)<CR>", opts)
map("n", "<A-j>", "<cmd>MoveLine(1)<CR>", opts)
map("n", "<A-h>", "<cmd>MoveHChar(-1)<CR>", opts)
map("n", "<A-l>", "<cmd>MoveHChar(1)<CR>", opts)

-- Mover linhas no modo visual
map("v", "<A-h>", "<cmd>MoveHBlock(-1)<CR>", opts)
map("v", "<A-j>", "<cmd>MoveBlock(1)<CR>", opts)
map("v", "<A-k>", "<cmd>MoveBlock(-1)<CR>", opts)
map("v", "<A-l>", "<cmd>MoveHBlock(1)<CR>", opts)

-- Shift tab
map("i", "<S-Tab>", "<C-d>", opts)

-- Limpar highlights de busca
map("n", "<leader>nh", "<cmd>nohl<CR>", opts)

-- Redimensionar buffer
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Neotree
map("n", "<leader>n", ":Neotree toggle<CR>", opts)

-- Lspsaga
map("n", "<F12>", "<cmd>Lspsaga peek_definition<CR>", opts)
map("n", "<S-F12>", "<cmd>Lspsaga hover_doc<CR>", opts)
map("n", "<C-S-F12>", "<cmd>Lspsaga finder<CR>", opts)
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
map("n", "<C-t>", "<cmd>Lspsaga term_toggle<CR>", opts)
map("t", "<C-t>", "<cmd>Lspsaga term_toggle<CR>", opts)

-- Native LSP
map("n", "<C-F12>", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({timeout_ms = 1000000})<cr>")

-- Code folding
map("n", "<C-m><C-p>", "<cmd>lua require('ufo').openAllFolds()<CR>")
map("n", "<A-m><A-p>", "<cmd>lua require('ufo').closeAllFolds()<CR>")
