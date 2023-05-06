lvim.leader = "space"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "kj", "<ESC>", opts)

lvim.builtin.which_key.mappings["m"] = {
  name = "markdown",
  p = { "<cmd>:MarkdownPreviewToggle<CR>", "Preview" }
}

lvim.builtin.which_key.mappings["lp"] = {
  name = "Peek",
  d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
  r = { "<cmd>lua require('goto-preview').goto_preview_references()<CR>", "Reference" },
  i = { "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", "Implementation" },
  t = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Type Def" }
}

lvim.builtin.which_key.mappings["ss"] = {
  name = "Scratch Buffers",
  s = { "<cmd>:e ~/scratchFolder/scratchpad.js<CR>", "Scratch Pad" }
}

lvim.builtin.which_key.mappings["gd"] = {
  name = "Diff",
  c = { "<cmd>:DiffviewClose<CR>", "close diff" },
  d = { "<cmd>:DiffviewOpen<CR>", "open diff" },
  h = { "<cmd>:DiffviewFileHistory<CR>", "file history" },
}

