local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "terraformls",
  "golangci_lint_ls",
  "gopls",
  "bashls",
  "solargraph",
  "pylsp",
  "yamlls",
  "helm_ls",
  "tflint"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "terraform", "hcl", "terraform-vars" }
}
-- 
-- lspconfig.pyright.setup { blabla}
