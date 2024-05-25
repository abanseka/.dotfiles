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
keymap.set("n", "<leader>;", "<cmd>Dashboard<CR>", opts)

-- find and replace
keymap.set("n", "<leader>r", '<cmd>lua require("spectre").toggle()<CR>', opts)
keymap.set("n", "<leader>rw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', opts)
keymap.set("n", "<leader>rb", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', opts)
keymap.set("v", "<leader>rv", '<esc><cmd>lua require("spectre").open_visual()<CR>', opts)

-- no highlight
keymap.set("n", "<leader>h", "<cmd>noh<CR>", opts)

-- rest
keymap.set("n", "<leader>rr", "<cmd>lua require('rest-nvim').run()<cr>", opts)

-- adust indentation
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "<", "<gv", opts)

-- lazy
keymap.set("n", "<leader>ps", "<cmd>Lazy sync<CR>", opts)
keymap.set("n", "<leader>pu", "<cmd>Lazy update<CR>", opts)
keymap.set("n", "<leader>pi", "<cmd>Lazy install<CR>", opts)
keymap.set("n", "<leader>pc", "<cmd>Lazy clean<CR>", opts)

-- move
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

--view
keymap.set("n", "<leader>vv", "<cmd>vsplit<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>split<cr>", opts)
keymap.set("n", "<leader>vc", "<cmd>close<cr>", opts)
keymap.set("n", "<leader>vn", "<cmd>DiffviewClose<CR>", opts)
keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory%<CR>", opts)
keymap.set("n", "<leader>vg", "<cmd>DiffviewOpen<CR>", opts)
keymap.set("n", "<leader>vd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)

--nvim
keymap.set("n", "<leader>ne", "<cmd>e ~/.config/nvim/init.lua<cr>", opts)
keymap.set("n", "<leader>nf", "<cmd>e ~/scratch/scratch.md<cr>", opts)
keymap.set("n", "<leader>nr", "<cmd>e ~/http/rest.http<cr>", opts)

-- ai
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
keymap.set("n", "<leader>c", "<cmd>bd<CR>", opts)
