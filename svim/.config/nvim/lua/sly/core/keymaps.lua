-- set leader key to space
vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- general
keymap.set("i", "kj", "<ESC>", opts)
vim.api.nvim_set_keymap("n", "j", "gj", opts)
vim.api.nvim_set_keymap("n", "k", "gk", opts)
keymap.set("n", "<leader>w", "<cmd>w<CR>", opts)
keymap.set("n", "<leader>q", "<cmd>q<CR>", opts)
keymap.set("n", "<leader>h", "<cmd>noh<CR>", opts)
keymap.set("n", "<leader>rr", "<cmd>lua require('rest-nvim').run()<cr>", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "<", "<gv", opts)

-- move
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

--view
keymap.set("n", "<leader>vv", "<cmd>vsplit<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>split<cr>", opts)
keymap.set("n", "<leader>vc", "<cmd>close<cr>", opts)
keymap.set("n", "<leader>vs", "<cmd>e ~/scratchFolder/scratchpad.js<cr>", opts)
keymap.set("n", "<leader>vn", "<cmd>DiffviewClose<CR>", opts)
keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory%<CR>", opts)
keymap.set("n", "<leader>vg", "<cmd>DiffviewOpen<CR>", opts)

--nvim
keymap.set("n", "<leader>ne", "<cmd>e ~/.config/nvim/init.lua<cr>", opts)
keymap.set("n", "<leader>nf", "<cmd>ene<cr>", opts)

-- ai
keymap.set("n", "<leader>ao", "<cmd>ChatGPT<cr>", opts)
keymap.set("n", "<leader>ao", "<cmd>ChatGPT<cr>", opts)
keymap.set("v", "<leader>ae", "<cmd>ChatGPTEditWithInstruction<cr>", opts)
keymap.set("v", "<leader>ak", "<cmd>ChatGPTRun keywords<cr>", opts)
keymap.set("v", "<leader>ad", "<cmd>ChatGPTRun docstring<cr>", opts)
keymap.set("v", "<leader>at", "<cmd>ChatGPTRun add_tests<cr>", opts)
keymap.set("v", "<leader>ar", "<cmd>ChatGPTRun optimize_code<cr>", opts)
keymap.set("v", "<leader>as", "<cmd>ChatGPTRun summarize<cr>", opts)
keymap.set("v", "<leader>af", "<cmd>ChatGPTRun fix_bugs<cr>", opts)
keymap.set("v", "<leader>ax", "<cmd>ChatGPTRun explain_code<cr>", opts)
keymap.set("v", "<leader>aa", "<cmd>ChatGPTRun code_readability_analysis<cr>", opts)

-- bufferline
keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>", opts)
keymap.set("n", "<leader>bk", "<cmd>BufferLinePickClose<cr>", opts)
keymap.set("n", "<leader>c", ":bp <BAR> bd #<CR>", opts)
