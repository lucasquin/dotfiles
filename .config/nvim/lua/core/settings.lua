local v = vim.opt

v.guifont = "CaskaydiaCove NFM:h8"
v.showmode = false
v.showcmd = true
v.cursorline = false 
v.title = true
v.titlestring = ""
v.syntax = "on"
v.number = true
v.relativenumber = true
v.termguicolors = true
v.signcolumn = "yes"
v.cmdheight = 1
vim.g.icons_enabled = true
vim.o.fillchars = [[vert:█,eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
v.wildmenu = true
v.backup = false
v.swapfile = false
v.writebackup = false
v.history = 50
v.undolevels = 1000
v.updatetime = 500
v.copyindent = true
v.autowrite = true
v.autoread = true
v.incsearch = true
v.ignorecase = true
v.smartcase = true
v.wrap = false
v.scrolloff = 1
v.completeopt = "menu,menuone,noselect"
v.encoding = "utf-8"
v.fileencoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.termeconfing = "utf-8"
v.autoindent = true
v.expandtab = true
v.tabstop = 4
v.softtabstop = 4
v.shiftwidth = 4
v.backspace = "indent,eol,start"
v.smarttab = true

local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1

if is_windows then
	vim.opt.shell = "pwsh.exe"
	vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
	vim.cmd([[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]])

	vim.g.clipboard = {
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
	}
end
