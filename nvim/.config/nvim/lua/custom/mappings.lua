local M = {}

M.general = {
  n = {
    ["<leader>h"] = { "<cmd> noh <CR>", "noh" },
    ["<leader>q"] = { "<cmd> q <CR>", "quite" },
    ["<leader>w"] = { "<cmd> w <CR>", "save" },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "files" },
    ["<leader>d"] = { "<cmd> bdelete <CR>", "close" },
    ["<leader>sv"] = { "<cmd> vsplit <CR>", "vsplit" },
    ["<leader>sh"] = { "<cmd> split <CR>", "hsplit" },
    ["<leader>c"] = { "<cmd> close <CR>", "splitClose" },

    --buffer
    ["<leader>bj"] = { "<cmd> BufferLinePick <CR>", "BuffPic" },

    -- seamless tmux-vim
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", "" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", "" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", "" },

    -- git
    ["<leadergj"] = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    ["<leader>gk"] = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    ["<leader>gl"] = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    ["<leader>gp"] = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    ["<leader>gr"] = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    ["<leader>gs"] = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    ["<leader>gu"] = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    ["<leader>gd"] = { "<cmd>DiffviewOpen<CR>", "Diff" },
    ["<leader>gc"] = { "<cmd>DiffviewClose<CR>", "CDiff" },
    ["<leader>gh"] = { "<cmd>DiffviewFileHistory%<CR>", "fHistory" },

    -- preview
    ["<leader>pd"] = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["<leader>lr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "LSP rename",
    },

    ["<leader>lk"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev",
    },

    ["<leader>lj"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next",
    },

    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP code action",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>sf"] = { "<cmd> Telescope find_files <CR>", "files" },
    ["<leader>st"] = { "<cmd> Telescope live_grep <CR>", "grep" },
    ["<leader>sb"] = { "<cmd> Telescope buffers <CR>", "buffers" },
    ["<leader>sh"] = { "<cmd> Telescope help_tags <CR>", "help" },
    ["<leader>sr"] = { "<cmd> Telescope oldfiles <CR>", "recent" },
    ["<leader>ss"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "in buffer" },
    ["<leader>sa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Afiles" },

    -- diagnostics
    ["<leader>ls"] = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "symbols" },
    ["<leader>ld"] = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "BDiagnostics" },
    ["<leader>lw"] = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  },
}

---------------------------------------------- disabled --------------------------------------------------------------
M.disabled = {
  plugin = true,
  n = {
    ["<leader>fa"] = "",
    ["<leader>fb"] = "",
    ["<leader>ff"] = "",
    ["<leader>fh"] = "",
    ["<leader>fo"] = "",
    ["<leader>fw"] = "",
    ["<leader>fz"] = "",
    ["<leader>ma"] = "",
    ["<leader>ch"] = "",
    ["<leader>cm"] = "",
    ["<leader>ca"] = "",
    ["<leader>cc"] = "",
    ["<C-a>"] = "",
  },
}

return M
