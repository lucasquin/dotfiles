local _, cmp = pcall(require, "cmp")
if not _ then
	return
end

local _, luasnip = pcall(require, "luasnip")
if not _ then
	return
end

local _, lspkind = pcall(require, "lspkind")
if not _ then
	return
end

local border_opts = {
	border = "single",
	winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
}

cmp.setup({
	active = true,
	on_config_done = nil,
	completion = {
		keyword_length = 1,
	},
	experimental = {
		ghost_text = true,
		native_menu = false,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol_text",
			maxwidth = 50,
			ellipsis_char = "...",
		}),
		duplicates = {
			buffer = 1,
			path = 1,
			nvim_lsp = 0,
			luasnip = 1,
		},
		duplicates_default = 0,
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(border_opts),
		documentation = cmp.config.window.bordered(border_opts),
	},
	sources = {
		{
			name = "copilot",
			max_item_count = 3,
			trigger_characters = {
				{
					".",
					":",
					"(",
					"'",
					'"',
					"[",
					",",
					"#",
					"*",
					"@",
					"|",
					"=",
					"-",
					"{",
					"/",
					"\\",
					"+",
					"?",
					" ",
				},
			},
		},
		{
			name = "nvim_lsp",
			entry_filter = function(entry, ctx)
				local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
				if kind == "Snippet" and ctx.prev_context.filetype == "java" then
					return false
				end
				return true
			end,
		},

		{ name = "nvim_lsp_signature_help" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "cmp_tabnine" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "treesitter" },
		{ name = "crates" },
		{ name = "tmux" },
	},
	mapping = {
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},
	cmdline = {
		enable = false,
		options = {
			{
				type = ":",
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			},
			{
				type = { "/", "?" },
				sources = {
					{ name = "buffer" },
				},
			},
		},
	},
})
