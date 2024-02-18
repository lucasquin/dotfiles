vim.filetype.add {
  pattern = {
    ["*.log"] = "log",
    ["*_LOG"] = "log",
    ["*.go"] = "go",
    ["*.s"] = "asm",
    ["*.tmpl"] = "gotexttmpl",
    ["*.gotext"] = "gotexttmpl",
    ["*.gohtml"] = "gohtmltmpl",
    ["go.sum"] = "gosum",
    ["go.work.sum"] = "gosum",
    ["go.work"] = "gowork",
    ["*.mod"] = "gomod",
    ["*.MOD"] = "gomod",
  },
}
