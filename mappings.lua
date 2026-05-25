---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd> qa! <CR>", "Quit Neovim." },
    ["<M-w>"] = { "<cmd> WhichKey <CR>", "Open whichkey menu." },
    ["<leader>fs"] = { "<cmd> Telescope lsp_workspace_symbols <CR>", "Find Symbols." },
  },
}

M.scissors = {
  n = {
    ["<leader>sa"] = {
      function()
        require("scissors").addNewSnippet()
      end,
      "Add new snippet",
    },
    ["<leader>sr"] = {
      function()
        require("scissors").editSnippet()
      end,
      "Edit snippet",
    },
  },
}

-- more keybinds!
M.LSPSaga = {
  n = {
    ["<leader>la"] = { "<cmd>Lspsaga code_action <CR>", "Code action" },
    ["<leader>lh"] = { "<cmd>Lspsaga hover_doc <CR>", "Hover docs" },
    ["<leader>lr"] = { "<cmd>Lspsaga finder <CR>", "Find references" },
    ["<leader>ld"] = { "<cmd>Lspsaga peek_definition <CR>", "Show definition" },
    ["<leader>lo"] = { "<cmd>Lspsaga outline <CR>", "Symbols outline" },
  },
}
M.distant = {
  plugin = true,
  n = {
    ["<leader>ro"] = { "<cmd>DistantOpen ", "Distant open" },
    ["<leader>rc"] = { "<cmd>DistantConnect ssh://", "Distant connect" },
  },
}

M.copilot = {
  plugin = true,
  n = {
    ["<leader>aH"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.help_actions())
      end,
      "Copilot help actions",
    },
    -- Show prompts actions with fzf-lua
    ["<leader>aP"] = {
      function()
        local actions = require "CopilotChat.actions"
        require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
      end,
      "Copilot prompt actions",
    },
  },
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>du"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle Debug UI",
    },
    ["<leader>db"] = {
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
    ["<leader>dpm"] = {
      function()
        require("dap-python").test_method()
      end,
      "Run the current test method",
    },
    ["<leader>dpc"] = {
      function()
        require("dap-python").test_class()
      end,
      "Run the current test class",
    },
    ["<leader>dps"] = {
      function()
        require("dap-python").debug_selection()
      end,
      "Debug last",
    },
    ["<leader>dpb"] = {
      function()
        require("dap-python").debug_breakpoint()
      end,
      "Debug breakpoint",
    },
    ["<leader>dpn"] = {
      function()
        require("dap-python").debug_test_nearest()
      end,
      "Debug test nearest",
    },
    ["<leader>dpl"] = {
      function()
        require("dap-python").debug_test_last()
      end,
      "Debug test last",
    },
    ["<leader>dpr"] = {
      function()
        require("dap-python").debug_test_repeat()
      end,
      "Debug test repeat",
    },
    ["<leader>dpf"] = {
      function()
        require("dap-python").debug_test_file()
      end,
      "Debug test file",
    },
    ["<leader>dpa"] = {
      function()
        require("dap-python").debug_test_suite()
      end,
      "Debug test suite",
    },
    ["<leader>dpy"] = {
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
    ["<leader>dgn"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug nearest go test.",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug the last go test.",
    },
  },
}

M.ai = {
  n = {
    ["<leader>aa"] = { "<cmd>AvanteAsk<CR>", "Avante ask" },
    ["<leader>ab"] = { "<cmd>AvanteBuild<CR>", "Avante build" },
    ["<leader>ac"] = { "<cmd>AvanteChat<CR>", "Avante chat" },
    ["<leader>aC"] = { "<cmd>AvanteClear<CR>", "Avante clear" },
    ["<leader>ae"] = { "<cmd>AvanteEdit<CR>", "Avante edit" },
    ["<leader>af"] = { "<cmd>AvanteFocus<CR>", "Avante focus" },
    ["<leader>ar"] = { "<cmd>AvanteRefresh<CR>", "Avante refresh" },
    ["<leader>aR"] = { "<cmd>AvanteShowRepoMap<CR>", "Avante repo map" },
    ["<leader>ap"] = { "<cmd>AvanteSwitchProvider<CR>", "Avante provider" },
    ["<leader>at"] = { "<cmd>AvanteToggle<CR>", "Avante toggle" },
  },
  v = {
    ["<leader>aG"] = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    ["<leader>ai"] = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
    ["<leader>ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar correction" },
    ["<leader>aL"] = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
    ["<leader>ak"] = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
    ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
    ["<leader>aT"] = { "<cmd>ChatGPTRun add_tests<CR>", "Add tests" },
    ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize code" },
    ["<leader>as"] = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix bugs" },
    ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<CR>", "Explain code" },
    ["<leader>ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen edit" },
    ["<leader>al"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Readability analysis" },
  },
}

return M
