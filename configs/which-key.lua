local M = {}

M.opts = {
  preset = "modern",
  delay = 150,
  expand = 2,
  sort = { "local", "order", "manual", "group", "alphanum", "mod" },
  icons = {
    group = "",
  },
  spec = {
    { "<leader>a", group = "AI" },
    { "<leader>c", group = "Code" },
    { "<leader>d", group = "Debug" },
    { "<leader>f", group = "Find" },
    { "<leader>g", group = "Git" },
    { "<leader>l", group = "LSP" },
    { "<leader>r", group = "Remote" },
    { "<leader>s", group = "Snippets" },
    { "<leader>t", group = "Theme" },
    { "<leader>w", group = "Which-key" },
    { "<leader>dp", group = "Python" },
    { "<leader>dg", group = "Go" },
  },
}

return M
