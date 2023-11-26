local M = {}

local health = vim.health or require("health")

local check_executable = function(bin, name, advice)
  if vim.fn.executable(bin) == 0 then
    health.error(string.format("Please install %s, %s", name, advice))
  else
    health.ok(string.format("%s is installed", name))
  end
end

M.check = function()
  health.start("Checking nvim configuration requirements")

  if not vim.fn.has("nvim-0.9.0") == 1 then
    health.error("Neovim >= 0.9.0 is required")
  end

  check_executable("npm", "npm", "https://nodejs.org/en/download/")
  check_executable("git", "git", "https://git-scm.com/downloads")
  check_executable("rg", "ripgrep", "https://github.com/BurntSushi/ripgrep#installation")
end

return M
