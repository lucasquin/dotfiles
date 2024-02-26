require "lucasquin.start"
require "lucasquin.settings"
require "lucasquin.keymaps"
require "lucasquin.autocmds"

Spec "lucasquin.neotree"

-- Colorscheme and syntax highlight 
Spec "lucasquin.colorscheme-tokyonight"
Spec "lucasquin.colorscheme-dracula"
Spec "lucasquin.colorscheme-vscode"
Spec "lucasquin.treesitter"

-- LSP specs
Spec "lucasquin.mason"
Spec "lucasquin.mason-tool-installer"
Spec "lucasquin.nvim-lsp"
Spec "lucasquin.cmp"
Spec "lucasquin.lspsaga"
Spec "lucasquin.nvim-lint"
Spec "lucasquin.conform"

-- UI specs
Spec "lucasquin.devicons"
Spec "lucasquin.lualine"
Spec "lucasquin.gitsigns"
Spec "lucasquin.ccc"
Spec "lucasquin.statuscol"
Spec "lucasquin.nvim-ufo"
Spec "lucasquin.indent-blankline"

-- Editor specs
Spec "lucasquin.autopairs"
Spec "lucasquin.autotag"
Spec "lucasquin.telescope"
Spec "lucasquin.auto-indent"
Spec "lucasquin.local-highlight"
Spec "lucasquin.template-string"
Spec "lucasquin.comment"
Spec "lucasquin.moveline"
Spec "lucasquin.tabular"
Spec "lucasquin.dap"
Spec "lucasquin.toggleterm"

require "lucasquin.lazy"
