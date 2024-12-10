-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Use the BufReadPost or BufEnter event to set nowinfixbuf for all files
vim.api.nvim_create_autocmd({"BufReadPost", "BufEnter"}, {
    callback = function()
        vim.opt_local.winfixbuf = false
    end
})
vim.filetype.add { extension = { hcl = "terraform" } }
vim.g.snipmate_snippets_path = "~/.config/nvim/lua/custom/snippets"
vim.g.vscode_snippets_path = "~/.config/nvim/lua/custom/vscode_snippets"
vim.wo.relativenumber = true
vim.wo.number = true
