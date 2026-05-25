local lint = require "lint"

lint.linters_by_ft = {
  ansible = { "ansible_lint" },
  go = { "golangcilint" },
  python = { "mypy", "ruff" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  terraform = { "tflint" },
  yaml = { "yamllint" },
}

local lint_group = vim.api.nvim_create_augroup("CustomLint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_group,
  callback = function()
    lint.try_lint()
  end,
})
