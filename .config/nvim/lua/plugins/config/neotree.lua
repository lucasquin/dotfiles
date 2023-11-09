local _, neotree = pcall(require, "neo-tree")
if not _ then
	return
end

local fc = require("neo-tree.sources.filesystem.components")

neotree.setup({
	sources = { "filesystem", "buffers", "git_status", "document_symbols" },
	open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
	filesystem = {
		bind_to_cwd = false,
		follow_current_file = { enabled = true },
		use_libuv_file_watcher = true,
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
		mappings = {
			["<space>"] = "none",
		},
	},
	default_component_configs = {
		indent = {
			with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
			expander_collapsed = "",
			expander_expanded = "",
			expander_highlight = "NeoTreeExpander",
		},
	},
})
