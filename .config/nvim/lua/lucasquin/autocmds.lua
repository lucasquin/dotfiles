vim.cmd [[
    augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
    augroup END
  ]]

function disable_diagnostic()
  return vim.bo.filetype == "svelte"
end

vim.cmd [[
    augroup diagnostics
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * lua if disable_diagnostic() then vim.diagnostic.disable() end
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave * lua if not disable_diagnostic() then vim.diagnostic.enable() end
    augroup END
  ]]
