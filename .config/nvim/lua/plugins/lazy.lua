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
	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
	},

	-- Useful
	{ "preservim/nerdcommenter" },
	{ "fedepujol/move.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	{ "luukvbaal/statuscol.nvim" },
	{ "axelvc/template-string.nvim", dependencies = { "nvim-treesitter/nvim-treesitter" } },
	{ "godlygeek/tabular" },
	{ "sontungexpt/url-open", event = "VeryLazy", cmd = "URLOpenUnderCursor" },
	{ "VidocqH/auto-indent.nvim" },
	{ "lewis6991/gitsigns.nvim", enabled = vim.fn.executable("git") == 1, ft = "gitcommit" },

	-- Colorschemes
	{ "folke/tokyonight.nvim" },
	{ "Mofiqul/dracula.nvim" },

	-- UI
	{ "uga-rosa/ccc.nvim" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "tzachar/local-highlight.nvim" },
	{ "nvim-lualine/lualine.nvim" },

	-- Syntax highlight
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},

	-- LSP && Formating
	{ "onsails/lspkind.nvim" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},
	{ "nvimtools/none-ls.nvim" },

	-- Completion && Snippets
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "lukas-reineke/cmp-under-comparator" },
			{ "saadparwaiz1/cmp_luasnip" },
		},
	},
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
}

local opts = {}

require("lazy").setup(plugins, opts)
