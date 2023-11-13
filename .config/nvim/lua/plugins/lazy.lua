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
	{ "Mofiqul/vscode.nvim" },
	--
	-- UI
	{ "uga-rosa/ccc.nvim", event = "VeryLazy" },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "tzachar/local-highlight.nvim", event = "VeryLazy" },
	{ "nvim-lualine/lualine.nvim", event = "VeryLazy" },

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
		event = "InsertEnter",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },
			{ "lukas-reineke/cmp-under-comparator" },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		build = (not jit.os:find("Windows"))
				and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
			or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_lua").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load()
			end,
		},
		opts = {
			history = true,
			delete_check_events = "TextChanged",
		},
		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true,
				silent = true,
				mode = "i",
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s",
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" },
			},
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
