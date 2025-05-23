-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- general
keymap.set("i", "kj", "<ESC>", opts)
keymap.set("n", "<leader>ww", "<cmd>w!<CR>", opts)
keymap.set("n", "<leader>;", "<cmd>lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})<CR>", opts)

-- Git Fugitive
keymap.set("n", "<leader>gf", "<cmd>Git<CR>", opts)

-- buffer
keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>", opts)
keymap.set("n", "<leader>bk", "<cmd>BufferLinePickClose<cr>", opts)

-- move
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", opts)
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", opts)
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", opts)
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", opts)

-- no highlight
keymap.set("n", "<leader>h", "<cmd>noh<CR>", opts)

-- adjust indentation
keymap.set("v", ">", ">gv", opts)
keymap.set("v", "<", "<gv", opts)

--nvim
keymap.set("n", "<leader>nf", "<cmd>e ~/scratch/scratch.md<cr>", opts)

--view
keymap.set("n", "<leader>vv", "<cmd>vsplit<cr>", opts)
keymap.set("n", "<leader>vh", "<cmd>split<cr>", opts)
keymap.set("n", "<leader>vc", "<cmd>close<cr>", opts)
keymap.set("n", "<leader>vn", "<cmd>DiffviewClose<CR>", opts)
keymap.set("n", "<leader>vf", "<cmd>DiffviewFileHistory%<CR>", opts)
keymap.set("n", "<leader>vg", "<cmd>DiffviewOpen<CR>", opts)
keymap.set("n", "<leader>vd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)

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
