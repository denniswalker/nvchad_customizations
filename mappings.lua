---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "Find files." },
    ["<M-w"] = { "<cmd> WhichKey <CR>", "Open whichkey menu." },
    ["<C-o>"] = { "<cmd> Lspsaga outline <CR>", "Open symbols outline." },
    ["<leader>fs"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Find Symbols." },
  },
}

-- more keybinds!
M.LSPSaga = {
  n = {
    ["<leader>dca"] = { "<cmd>Lspsaga code_action <CR>", "Code action" },
    ["<leader>dch"] = { "<cmd>Lspsaga hover_doc <CR>", "Hover docs" },
    ["<leader>dcf"] = { "<cmd>Lspsaga finder <CR>", "Find references" },
    ["<leader>dcp"] = { "<cmd>Lspsaga peek_definition <CR>", "Show definition" },
  },
}
M.debug = {
  n = {
    ["<leader>ddd"] = { "<cmd> lua require('dapui').toggle() <CR>", "Toggle Debug" },
    ["<leader>ddb"] = { "<cmd> lua require('dap').toggle_breakpoint() <CR>", "Toggle Breakpoint" },
  },
}

M.ChatGPT = {
  v = {
    ["<leader>dgc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>dge"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>dgg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    ["<leader>dgt"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>dgk"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>dgd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>dga"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    ["<leader>dgo"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    ["<leader>dgs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>dgf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    ["<leader>dgx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    ["<leader>dgr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    ["<leader>dgl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  },
}

return M
