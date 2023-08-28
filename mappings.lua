---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-p>"] = {"<cmd> Telescope commands <CR>", "Open command palette."},
    ["<M-w"] = {"<cmd> WhichKey <CR>", "Open whichkey menu."},
    ["<C-o>"] = {"<cmd> SymbolsOutline <CR>", "Open symbols outline."},
    ["<leader>fs"] = {"<cmd> Telescope lsp_workspace_symbols <CR>", "Find Symbols."},
  },
}

-- more keybinds!

M.debug = {
  n = {
    ["<C-d>"] = {"<cmd> lua require('dapui').toggle() <CR>", "Toggle Debug"},
    ["<A-d>"] = {"<cmd> lua require('dap').toggle_breakpoint() <CR>", "Toggle Breakpoint"}
  }
}

M.ChatGPT = {
  v = {
    ["<leader>cc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>ce"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>cg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    ["<leader>ct"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>ck"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>cd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>ca"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    ["<leader>co"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    ["<leader>cs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>cf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    ["<leader>cx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    ["<leader>cr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    ["<leader>cl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  }
}

return M
