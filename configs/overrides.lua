local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "go",
    "terraform",
    "python",
    "yaml",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- Shell
    "dockerfile-language-server",
    "helm-ls",
    "bash-language-server",
    "bash-debug-adapter",
    "shfmt",
    "shellcheck",

    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- golang
    "gopls",
    "golangci-lint",
    "goimports-reviser",
    "golines",
    "gofumpt",
    "delve",

    -- ruby
    "solargraph",

    -- python
    "python-lsp-server",
    "black",
    "pylama",
    "pyright",
    "mypy",
    "ruff",
    "debugpy",

    -- terraform
    "tflint",
    "terraform-ls",

    -- yaml
    "yaml-language-server",
    "yamlfix",

    -- Ansible
    "ansiblelint",
    "ansible-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = true,
  },
  panel = {
    enable = true,
  },
}
return M
