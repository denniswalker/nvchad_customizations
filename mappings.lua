---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd> qa! <CR>", "Quit Neovim." },
    ["<M-w"] = { "<cmd> WhichKey <CR>", "Open whichkey menu." },
    ["<leader>mco"] = { "<cmd> Lspsaga outline <CR>", "Open symbols outline." },
    ["<leader>fs"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Find Symbols." },
  },
}

-- more keybinds!
M.LSPSaga = {
  n = {
    ["<leader>mca"] = { "<cmd>Lspsaga code_action <CR>", "Code action" },
    ["<leader>mch"] = { "<cmd>Lspsaga hover_doc <CR>", "Hover docs" },
    ["<leader>mcf"] = { "<cmd>Lspsaga finder <CR>", "Find references" },
    ["<leader>mcp"] = { "<cmd>Lspsaga peek_definition <CR>", "Show definition" },
  },
}
M.distant = {
  plugin = true,
  n = {
    ["<leader>mro"] = { "<cmd>DistantOpen ", "Distant Open" },
    ["<leader>mrc"] = { "<cmd>DistantConnect ssh://", "Distant Connect" },
  },
}

M.copilot = {
  plugin = true,
  n = {
    ["<leader>mcch"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      desc = "CopilotChat - Help actions",
    },
    -- Show prompts actions with fzf-lua
    ["<leader>mccp"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      desc = "CopilotChat - Prompt actions",
    },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>mdd"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debug UI",
    },
    ["<leader>mdt"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>mdptm"] = {
      function()
        require("dap-python").test_method()
      end,
      "Run the current test method",
    },
    ["<leader>mdptc"] = {
      function()
        require("dap-python").test_class()
      end,
      "Run the current test class",
    },
    ["<leader>mdps"] = {
      function()
        require("dap-python").debug_selection()
      end,
      "Debug last",
    },
    ["<leader>mdpb"] = {
      function()
        require("dap-python").debug_breakpoint()
      end,
      "Debug breakpoint",
    },
    ["<leader>mdptn"] = {
      function()
        require("dap-python").debug_test_nearest()
      end,
      "Debug test nearest",
    },
    ["<leader>mdptl"] = {
      function()
        require("dap-python").debug_test_last()
      end,
      "Debug test last",
    },
    ["<leader>mdptr"] = {
      function()
        require("dap-python").debug_test_repeat()
      end,
      "Debug test repeat",
    },
    ["<leader>mdptf"] = {
      function()
        require("dap-python").debug_test_file()
      end,
      "Debug test file",
    },
    ["<leader>mdpts"] = {
      function()
        require("dap-python").debug_test_suite()
      end,
      "Debug test suite",
    },
    ["<leader>mdpty"] = {
      function()
        require("dap-python").debug_test_flaky()
      end,
      "Debug test flaky",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>mdgtn"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug nearest go test.",
    },
    ["<leader>mdgtl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug the last go test.",
    },
  },
}

M.ChatGPT = {
  v = {
    ["<leader>mgc"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>mge"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>mgg"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
    ["<leader>mgt"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>mgk"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>mgd"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>mga"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
    ["<leader>mgo"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
    ["<leader>mgs"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>mgf"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
    ["<leader>mgx"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
    ["<leader>mgr"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
    ["<leader>mgl"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
  },
}

return M
