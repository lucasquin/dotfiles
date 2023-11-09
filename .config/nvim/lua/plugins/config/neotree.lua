local _, neotree = pcall(require, "neo-tree")
if not _ then
	return
end

local fc = require("neo-tree.sources.filesystem.components")

neotree.setup({
	close_if_last_window = false,
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = false,
	sort_function = nil,
	source_selector = {
		winbar = false,
		statusline = true,
	},
	sources = { "filesystem", "buffers", "git_status", "document_symbols" },
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = false, -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/914
        components = {
            name = function(config, node, state)
                local result = fc.name(config, node, state)
                if node:get_depth() == 1 and node.type ~= "message" then
                    result.text = vim.fn.fnamemodify(node.path, ":t")
                end
                return result
            end,
        },
	},
	window = {
		mapping_options = {
			noremap = true,
			nowait = true,
		},
		mappings = {
			["<space>"] = "none",
			["d"] = "delete",
		},
	},
	default_component_configs = {
		indent = {
			with_expanders = true,
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
		git_status = {
			symbols = {
				added = "",
				modified = "●",
				deleted = "",
				renamed = "",
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
})
