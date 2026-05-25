local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "mason-org/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "folke/which-key.nvim",
    opts = require("custom.configs.which-key").opts,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = overrides.copilot,
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    cmd = {
      "CopilotChat",
      "CopilotChatAgents",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
      "CopilotChatDocs",
      "CopilotChatExplain",
      "CopilotChatFix",
      "CopilotChatLoad",
      "CopilotChatOptimize",
      "CopilotChatReview",
      "CopilotChatSave",
      "CopilotChatTests",
      "CopilotChatToggle",
    },
    init = function()
      require("core.utils").load_mappings "copilot"
    end,
    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = false,
    },
  },

  {
    "yetone/avante.nvim",
    cmd = {
      "AvanteAsk",
      "AvanteBuild",
      "AvanteChat",
      "AvanteClear",
      "AvanteEdit",
      "AvanteFocus",
      "AvanteRefresh",
      "AvanteShowRepoMap",
      "AvanteSwitchProvider",
      "AvanteToggle",
    },
    version = false, -- set this if you want to always pull the latest change
    opts = {
      provider = "openai",
      auto_suggestions_provider = "openai",
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "chatgpt-4o-latest",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },

  {
    "jackMort/ChatGPT.nvim",
    cmd = {
      "ChatGPT",
      "ChatGPTActAs",
      "ChatGPTCompleteCode",
      "ChatGPTEditWithInstruction",
      "ChatGPTRun",
    },
    init = function()
      require("core.utils").load_mappings "ai"
    end,
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "echo -n $OPENAI_API_KEY",
        -- api_host_cmd = "echo -n 'api.openai.com'"
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path",
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 3 },
        { name = "copilot", group_index = 3 },
        { name = "luasnip", group_index = 3 },
        { name = "buffer", group_index = 3 },
        { name = "nvim_lua", group_index = 3 },
        { name = "path", group_index = 3 },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "custom.configs.lint"
    end,
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings "dap"
      require "custom.configs.dap"
    end,
  },

  { "rcarriga/nvim-notify" },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-python").setup(vim.fn.expand "$HOME/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")
      require("core.utils").load_mappings "dap_python"
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup {
        delve = {
          path = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/delve/dlv",
        },
      }
      require("core.utils").load_mappings "dap_go"
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function()
      require("gopher").setup()
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
  },

  {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    cmd = {
      "Distant",
      "DistantConnect",
      "DistantLaunch",
      "DistantOpen",
    },
    init = function()
      require("core.utils").load_mappings "distant"
    end,
    config = function()
      require("distant"):setup()
    end,
  },

  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- optional
    config = function()
      require("scissors").setup {
        snippetDir = vim.env.HOME .. "/.config/nvim/lua/custom/vscode_snippets",
      }
      require("core.utils").load_mappings "scissors"
    end,
  },

  -- To make a plugin not be loaded
  --{
  --  "NvChad/nvim-colorizer.lua",
  --   enabled = true
  --},

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
