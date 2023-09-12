local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
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
    config = function()
      require("copilot").setup {}
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    lazy = false,
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "lpass show openai_nvim_key --password",
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

  { "sheerun/vim-polyglot" },

  { "mfussenegger/nvim-dap" },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    config = function()
      require("dap-python").setup "python3"
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup()
    end,
    lazy = false,
  },

  {
    "kosayoda/nvim-lightbulb",
    config = function()
      require("nvim-lightbulb").setup {
        -- 4. Status text.
        -- When enabled, will allow using |NvimLightbulb.get_status_text|
        -- to retrieve the configured text.
        status_text = {
          enabled = true,
          -- Text to set if a lightbulb is available.
          text = "💡",
          -- Text to set if a lightbulb is unavailable.
          text_unavailable = "",
        },
        -- 1. Sign column.
        sign = {
          enabled = true,
          -- Text to show in the sign column.
          -- Must be between 1-2 characters.
          text = "💡",
          -- Highlight group to highlight the sign column text.
          hl = "LightBulbSign",
        },

        -- 2. Virtual text.
        virtual_text = {
          enabled = true,
          -- Text to show in the virt_text.
          text = "💡",
          -- Position of virtual text given to |nvim_buf_set_extmark|.
          -- Can be a number representing a fixed column (see `virt_text_pos`).
          -- Can be a string representing a position (see `virt_text_win_col`).
          pos = "eol",
          -- Highlight group to highlight the virtual text.
          hl = "LightBulbVirtualText",
          -- How to combine other highlights with text highlight.
          -- See `hl_mode` of |nvim_buf_set_extmark|.
          hl_mode = "combine",
        },

        -- 3. Floating window.
        float = {
          enabled = true,
          -- Text to show in the floating window.
          text = "💡",
          -- Highlight group to highlight the floating window.
          hl = "LightBulbFloatWin",
          -- Window options.
          -- See |vim.lsp.util.open_floating_preview| and |nvim_open_win|.
          -- Note that some options may be overridden by |open_floating_preview|.
          win_opts = {
            focusable = false,
          },
        },

        -- 5. Number column.
        number = {
          enabled = true,
          -- Highlight group to highlight the number column if there is a lightbulb.
          hl = "LightBulbNumber",
        },

        -- 6. Content line.
        line = {
          enabled = true,
          -- Highlight group to highlight the line if there is a lightbulb.
          hl = "LightBulbLine",
        },

        autocmd = { enabled = true },
      }
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
