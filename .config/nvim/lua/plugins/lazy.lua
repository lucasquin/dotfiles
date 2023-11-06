local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Dependencies
	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },
	{ "s1n7ax/nvim-window-picker" },
	{ "rcarriga/nvim-notify" },

	{ "nvim-neo-tree/neo-tree.nvim" },
	{ "preservim/nerdcommenter" },
	{ "fedepujol/move.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	{ "luukvbaal/statuscol.nvim" },
	{ "axelvc/template-string.nvim" },
	{ "godlygeek/tabular" },
	{ "sontungexpt/url-open" },
	{ "VidocqH/auto-indent.nvim" },
	{ "lewis6991/gitsigns.nvim", enabled = vim.fn.executable("git") == 1, ft = "gitcommit" },
	{ "jackMort/ChatGPT.nvim" },

	-- Colorschemes
	{ "folke/tokyonight.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "maxmx03/solarized.nvim" },

	-- UI
	{ "nvim-tree/nvim-web-devicons" },
	{ "uga-rosa/ccc.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "tzachar/local-highlight.nvim" },
	{ "nvim-lualine/lualine.nvim" },

	-- Syntax highlight
	{ "nvim-treesitter/nvim-treesitter" },

	-- Fuzzy finder
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1" },

	-- LSP && Formating
	{ "onsails/lspkind.nvim" },
	{ "nvimdev/lspsaga.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{ "nvimtools/none-ls.nvim" },

	-- Completion && Snippets
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "lukas-reineke/cmp-under-comparator" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
}

local opts = {}

require("lazy").setup(plugins, opts)
