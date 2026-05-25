-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
  callback = function()
    if vim.bo.buftype == "" then
      vim.opt_local.winfixbuf = false
    end
  end,
})
vim.filetype.add { extension = { hcl = "terraform" } }
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/vscode_snippets"
vim.opt.relativenumber = true
vim.opt.number = true
