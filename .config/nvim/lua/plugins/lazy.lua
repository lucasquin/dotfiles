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
	-- Commons
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-lua/plenary.nvim" },
	{ "rcarriga/nvim-notify" },

	-- Status bar
	{ "nvim-lualine/lualine.nvim" },

	-- Colorscheme
	{ "folke/tokyonight.nvim" },
	{ "Mofiqul/dracula.nvim" },

	-- Syntax
	{ "nvim-treesitter/nvim-treesitter" },

	-- File explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"s1n7ax/nvim-window-picker",
		},
	},

	-- Fuzzy finder
	{ "nvim-telescope/telescope.nvim", tag = "0.1.1" },

	-- Editor
	{ "preservim/nerdcommenter" },
	{ "fedepujol/move.nvim" },
	{ "uga-rosa/ccc.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "kevinhwang91/nvim-ufo", dependencies = { "kevinhwang91/promise-async" } },
	{ "luukvbaal/statuscol.nvim" },
	{ "axelvc/template-string.nvim" },
	{ "godlygeek/tabular" },
	{ "sontungexpt/url-open" },

	-- Git
	{ "lewis6991/gitsigns.nvim", enabled = vim.fn.executable("git") == 1, ft = "gitcommit" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },

	-- Snippets
	{ "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },

	-- LSP
	{ "onsails/lspkind.nvim" },
	{ "nvimdev/lspsaga.nvim" },
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "jay-babu/mason-null-ls.nvim" },
	{ "nvimtools/none-ls.nvim" },

	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lua" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "ray-x/cmp-treesitter" },
	{ "lukas-reineke/cmp-rg" },
	{ "lukas-reineke/cmp-under-comparator" },

	-- ChatGPT
	{ "jackMort/ChatGPT.nvim" },

	-- Highlight local cursor
	{ "tzachar/local-highlight.nvim" },
}

local opts = {}

require("lazy").setup(plugins, opts)
