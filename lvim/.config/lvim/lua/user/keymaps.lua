lvim.leader = "space"

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "kj", "<ESC>", opts)

-- view
lvim.builtin.which_key.mappings["vm"] = { "<cmd>:MarkdownPreviewToggle<CR>", "Preview" }
lvim.builtin.which_key.mappings["vd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" }
lvim.builtin.which_key.mappings["vv"] = { "<cmd>vsplit<CR>", "vsplit" }
lvim.builtin.which_key.mappings["vh"] = { "<cmd>split<CR>", "hsplit" }
lvim.builtin.which_key.mappings["vc"] = { "<cmd>close<CR>", "hsplit" }
lvim.builtin.which_key.mappings["vs"] = { "<cmd>e ~/scratchFolder/scratchpad.js<CR>", "Scratch Pad" }
lvim.builtin.which_key.mappings["gn"] = { "<cmd>DiffviewClose<CR>", "NukeDiff" }
lvim.builtin.which_key.mappings["gh"] = { "<cmd>DiffviewFileHistory%<CR>", "GFhistory" }
lvim.builtin.which_key.mappings["gd"] = { "<cmd>DiffviewOpen<CR>", "GDiff" }
lvim.builtin.which_key.mappings["sb"] = { "<cmd> Telescope buffers <CR>", "Buffers" }
lvim.builtin.which_key.mappings["rr"] = { "<cmd>lua require('rest-nvim').run()<CR>", "httpRun" }
