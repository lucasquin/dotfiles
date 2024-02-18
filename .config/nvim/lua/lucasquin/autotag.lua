local M = {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
}

M.config = function()
  require("nvim-ts-autotag").setup {}
end

return M
