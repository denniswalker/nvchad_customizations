---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gatekeeper",
  theme_toggle = { "gatekeeper", "gruvbox_light" },
  transparency = false,
  lsp_semantic_tokens = true,
  hl_override = highlights.override,
  hl_add = highlights.add,
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom_colored",
    border_color = "teal",
    selected_item_bg = "colored",
  },
  telescope = { style = "bordered"},
  lsp = {
    signature = {
      disabled = true,
      silent = true,
    }
  }
}
M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
