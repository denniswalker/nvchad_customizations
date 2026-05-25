local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = {
  "html",
  "cssls",
  "clangd",
  "golangci_lint_ls",
  "solargraph",
  "helm_ls",
  "tflint",
  "yamlls",
  "ansiblels",
}

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

vim.lsp.config("bashls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    bash = {
      explainshellEndpoint = "https://explainshell.com/explain?cmd=",
      includeAllWorkspaceSymbols = true,
    },
  },
})

vim.lsp.config("gopls", {
  cmd = { "gopls", "serve" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      completeUnimported = true,
      usePlaceholders = true,
    },
  },
})

vim.lsp.config("terraformls", {
  cmd = { "terraform-ls", "serve" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "terraform", "hcl", "terraform-vars" },
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "basic",
        stubPath = vim.fn.expand "~/.config/nvim/lua/custom/python/stubs",
      },
    },
  },
})

vim.lsp.enable(vim.list_extend(servers, {
  "bashls",
  "gopls",
  "terraformls",
  "pyright",
}))
