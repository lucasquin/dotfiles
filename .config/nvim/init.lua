require "lucasquin.start"
require "lucasquin.settings"
require "lucasquin.keymaps"
require "lucasquin.autocmds"

spec "lucasquin.neotree"

-- Colorscheme and syntax highlight specs
spec "lucasquin.colorscheme-tokyonight"
spec "lucasquin.colorscheme-dracula"
spec "lucasquin.colorscheme-vscode"
spec "lucasquin.treesitter"

-- LSP specs
spec "lucasquin.mason"
spec "lucasquin.mason-tool-installer"
spec "lucasquin.nvim-lsp"
spec "lucasquin.cmp"
spec "lucasquin.lspsaga"
spec "lucasquin.nvim-lint"
spec "lucasquin.conform"

-- UI specs
spec "lucasquin.devicons"
spec "lucasquin.lualine"
spec "lucasquin.gitsigns"
spec "lucasquin.modicator"
spec "lucasquin.ccc"
spec "lucasquin.statuscol"
spec "lucasquin.nvim-ufo"
spec "lucasquin.indent-blankline"

-- Editor specs
spec "lucasquin.autopairs"
spec "lucasquin.autotag"
spec "lucasquin.telescope"
spec "lucasquin.auto-indent"
spec "lucasquin.local-highlight"
spec "lucasquin.template-string"
spec "lucasquin.comment"
spec "lucasquin.moveline"
spec "lucasquin.tabular"
spec "lucasquin.dap"
spec "lucasquin.toggleterm"

require "lucasquin.lazy"
