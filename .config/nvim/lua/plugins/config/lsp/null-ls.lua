local _, null_ls = pcall(require, "null-ls")
if not _ then
    return
end

null_ls.setup()
