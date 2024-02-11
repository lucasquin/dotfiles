vim.cmd [[
    augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
  ]]

function disable_diagnostic()
  local file = vim.bo.filetype
  return file == "svelte" or file == "neo-tree"
end

vim.cmd [[
    augroup diagnostics
    autocmd!
    autocmd BufEnter * lua if disable_diagnostic() then vim.diagnostic.disable() end
    autocmd BufEnter * lua if not disable_diagnostic() then vim.diagnostic.enable() end
    augroup END
  ]]
