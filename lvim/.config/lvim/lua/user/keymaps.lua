local lvim = lvim
local vim = vim

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "kj", "<ESC>", opts)

-- view
lvim.leader = "space"
lvim.builtin.terminal.open_mapping = "<c-t>"

lvim.builtin.which_key.mappings["vd"] = {
  "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  "Definition"
}

lvim.builtin.which_key.mappings["vv"] = { "<cmd>vsplit<CR>", "vsplit" }
lvim.builtin.which_key.mappings["vh"] = { "<cmd>split<CR>", "hsplit" }
lvim.builtin.which_key.mappings["vc"] = { "<cmd>close<CR>", "hsplit" }
lvim.builtin.which_key.mappings["vs"] = { "<cmd>e ~/scratchFolder/scratchpad.js<CR>", "Scratch Pad" }
lvim.builtin.which_key.mappings["vn"] = { "<cmd>DiffviewClose<CR>", "NukeDiff" }
lvim.builtin.which_key.mappings["vf"] = { "<cmd>DiffviewFileHistory%<CR>", "GFhistory" }
lvim.builtin.which_key.mappings["vg"] = { "<cmd>DiffviewOpen<CR>", "GDiff" }
lvim.builtin.which_key.mappings["rr"] = { "<cmd>lua require('rest-nvim').run()<CR>", "httpRun" }
lvim.builtin.which_key.mappings["ss"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "in buffer" }

lvim.builtin.which_key.mappings["a"] = {
  name = "ChatGPT",
  o = { "<cmd>ChatGPT<CR>", "open" },
  c = { "<C-c>", "close" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
}
