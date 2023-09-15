-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.filetype.add { extension = { hcl = "terraform" } }
vim.g.snipmate_snippets_path = "~/.config/nvim/lua/custom/snippets"
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/vscode_snippets"
vim.wo.relativenumber = true
vim.wo.number = true
