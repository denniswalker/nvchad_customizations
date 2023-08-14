---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

M.debug = {
  n = {
    ["<C-d>"] = {"<cmd> lua require('dapui').toggle() <CR>", "Toggle Debug"}
  }
}

return M
