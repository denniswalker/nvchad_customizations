local conform = require "conform"

conform.setup {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    css = { "prettier" },
    go = { "goimports-reviser", "gofumpt" },
    hcl = { "terraform_fmt" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    python = { "ruff_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    terraform = { "terraform_fmt" },
    ["terraform-vars"] = { "terraform_fmt" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "yamlfix" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
}
