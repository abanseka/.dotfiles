-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"

-- add your own keymapping
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("i", "kj", "<ESC>", opts)


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
}

-- colorscheme
vim.g.everforest_background = 'hard'
vim.g.everforest_current_word = "none"
vim.g.everforest_ui_contrast = "low"
vim.g.everforest_transparent_background = 1
vim.g.everforest_disable_terminal_colors = 1

vim.g.everforest_colors_override = {
  bg2 = '#1F252B',
  bg3 = '#1F252B',
  bg4 = '#1F252B',
  bg_dim = '#1F252B',
}


-- vanilla vim configs
-- emmet
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = ","

vim.opt.cursorline = true
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.fillchars = "diff:╱"
vim.opt_global.fillchars = "eob: "

vim.log.level = "warn"
lvim.colorscheme = "everforest"
lvim.format_on_save = true
lvim.transparent_window = false

lvim.lsp.document_highlight = false
lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.breadcrumbs.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.builtin.nvimtree.setup.view.width = 35
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.filters.custom = {}
lvim.builtin.nvimtree.setup.view.hide_root_folder = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false


-- Additional Plugins
lvim.plugins = {
  { "mattn/emmet-vim" },
  { "sainnhe/everforest" },
  { "p00f/nvim-ts-rainbow" },
  { "norcalli/nvim-colorizer.lua" },
  { "ggandor/lightspeed.nvim" },
  { 'rmagatti/goto-preview' },
  { 'metakirby5/codi.vim' },
  { 'sindrets/diffview.nvim', event = "BufRead" },
  { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "felipec/vim-sanegx",
    event = "BufRead",
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {}
    end
  }
}


-- dap config
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/dev/ms/vscode-node-debug2/out/src/nodeDebug.js' },
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
}

-- packer
local packer = require("packer")
packer.startup({ function()
  -- Your plugins here
end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  } })


-- preview
local preview = require('goto-preview')
preview.setup({
  border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
  opacity = 0,
  height = 20
})

-- ts-rainbow
require 'nvim-treesitter.configs'.setup {
  rainbow = {
    colors = {
      -- Colors here
      "#CF6D76",
      "#a89984",
      "#b16286",
      "#d79921",
      "#689d6a",
      "#d65d0e",
      "#458588",
    },
    -- Term colors
    termcolors = {
      -- Term colors here
    }
  },
}

lvim.autocommands = {
  {
    "BufNewFile,BufRead", -- see `:h autocmd-events`
    { -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { ".env*" }, -- see `:h autocmd-events`
      command = "set syntax=erlang",
    }
  },
}

-- context
lvim.builtin.breadcrumbs.options = {
  separator = "|",
  depth_limit = 2
}

-- indent blankline
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
lvim.builtin.indentlines.options = {
  enabled = false,
  use_treesitter = true,
  show_current_context = true,
  -- space_char_blankline = " ",
}

-- lualine
local function logo()
  return [[ ]]
end

lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "progress" }
lvim.builtin.lualine.sections.lualine_a = { { logo } }
lvim.builtin.lualine.sections.lualine_x = {
  { "branch", fmt = function(str)
    return str:sub(1, 11)
  end }
}

-- colorizer
local colorizer = require("colorizer")
colorizer.setup()

-- Prettier formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier" } }

-- lvim.format_on_save = {
--   pattern = "*",
--   timeout = 100,
-- }

-- Tabnine
local tabnine = require('cmp_tabnine.config')
tabnine:setup({
  sources = {
    {
      name = "cmp_tabnine"
    }
  },
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
})

-- dashboard
lvim.builtin.alpha.startify.section.header.val = {
  -- "                                                         ",
  -- "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
  -- "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
  -- "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
  -- "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
  -- "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
  -- "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
  -- "                                                         ",
}

lvim.builtin.alpha.dashboard.section.header.val = {
  "                                                         ",
  "                                                         ",
  "                                                         ",
  "                                                         ",
  "                                                         ",
  "                                                         ",
}

lvim.builtin.alpha.dashboard.section.buttons.entries = {
  { "SPC f", "  Find File", "<CMD>Telescope find_files<CR>" },
  { "SPC n", "ﱐ  New File", "<CMD>ene!<CR>" },
  { "SPC P", "  Recent Projects ", "<CMD>Telescope projects<CR>" },
  { "SPC s r", "ﭯ  Recently Used Files", "<CMD>Telescope oldfiles<CR>" },
  { "SPC s t", "  Find Word", "<CMD>Telescope live_grep<CR>" },
  {
    "SPC L c",
    "  Configuration",
    "<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>",
  },
}


-- file explorer
lvim.builtin.nvimtree.setup.diagnostics.icons = {
  hint = " ",
  info = " ",
  warning = " ",
  error = " ",
}

lvim.builtin.nvimtree.setup.renderer.icons.glyphs = {
  default = " ",
  symlink = " ",
  git = {
    unstaged = "笠",
    staged = "ﮉ ",
    unmerged = "狀",
    renamed = "識",
    deleted = "ﰡ ",
    untracked = "炙",
    ignored = " ",
  },
  folder = {
    default = " ",
    open = " ",
    empty = " ",
    empty_open = " ",
    symlink = " ",
  },
}

-- bufferline
lvim.builtin.bufferline.options = {
  mode = "buffers",
  buffer_close_icon = "",
  modified_icon = "●",
  close_icon = "",
  left_trunc_marker = "",
  right_trunc_marker = "",
  tab_size = 10,
  idicator = {
    icon = " ",
    style = "icon",
  },
}

-- whichkey
lvim.builtin.which_key.setup = {
  icons = {
    breadcrumb = "  ",
    separator = "  ",
    group = "  ",
  },
  layout = {
    align = "center",
    spacing = 5
  },
  window = {
    border = "none"
  }
}

-- Telescope
lvim.builtin.telescope.defaults.layout_strategy = "vertical"
lvim.builtin.telescope.defaults = {
  prompt_prefix = " ",
  selection_caret = "ﰳ ",
  sorting_strategy = "descending",
}


-- keymappings
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
  s = { "<cmd>:e ~/scratchpad.md<CR>", "Scratch Pad" }
}


lvim.builtin.which_key.mappings["gd"] = {
  name = "Diff",
  c = { "<cmd>:DiffviewClose<CR>", "close diff" },
  d = { "<cmd>:DiffviewOpen<CR>", "open diff" },
  h = { "<cmd>:DiffviewFileHistory<CR>", "file history" },
}
