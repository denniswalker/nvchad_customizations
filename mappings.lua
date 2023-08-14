---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-p>"] = {"<cmd> Telescope commands <CR>", "Open command palette."}
  },
}

-- more keybinds!

M.debug = {
  n = {
    ["<C-d>"] = {"<cmd> lua require('dapui').toggle() <CR>", "Toggle Debug"},
    ["<A-d>"] = {"<cmd> lua require('dap').toggle_breakpoint() <CR>", "Toggle Breakpoint"}
  }
}

return M
