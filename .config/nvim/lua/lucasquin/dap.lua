local M = {
  "mfussenegger/nvim-dap",
  ft = {
    "go",
  },
  dependencies = {
    { "rcarriga/nvim-dap-ui", opts = true },
    { "theHamsta/nvim-dap-virtual-text", opts = true },
    { "LiadOz/nvim-dap-repl-highlights", opts = true },
  },
}

M.config = function()
  local dap = require "dap"
  local dapui = require "dapui"

  vim.fn.sign_define("DapBreakpoint", { text = "⬤", texthl = "DiagnosticError", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "", linehl = "DiagnosticInfo", numhl = "" })
  vim.fn.sign_define( "DapStopped", { text = "󰁕 ", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" })
  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "", linehl = "", numhl = "" })

  require("nvim-dap-repl-highlights").setup()
  require("nvim-dap-virtual-text").setup()

  -- Automatically open UI
  dap.listeners.after.event_initialized["dapui_config"] = function()
    vim.cmd ":Neotree close"
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    vim.cmd ":Neotree"
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    vim.cmd ":Neotree"
  end

  dap.adapters.go = function(callback)
    local handle
    local port = 38697
    handle = vim.loop.spawn("dlv", {
      args = { "dap", "-l", "127.0.0.1:" .. port },
      detached = true,
    }, function(_)
      handle:close()
    end)
    vim.defer_fn(function()
      callback { type = "server", host = "127.0.0.1", port = port }
    end, 100)
  end

  dap.configurations.go = {
    {
      type = "go",
      name = "Launch",
      request = "launch",
      program = function()
        local main_path = vim.fn.getcwd() .. "/main.go"
        local dir_entry = vim.loop.fs_stat(main_path)
        if dir_entry and dir_entry.type == "file" then
          return main_path
        else
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end
      end,
      repl_lang = "go",
    },
    {
      type = "go",
      name = "Launch test",
      request = "launch",
      mode = "test",
      program = function() -- Same logic as above
        local main_path = vim.fn.getcwd() .. "/main.go"
        local dir_entry = vim.loop.fs_stat(main_path)
        if dir_entry and dir_entry.type == "file" then
          return main_path
        else
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end
      end,
      repl_lang = "go",
    },
  }
end

return M
