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


-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

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


vim.log.level = "warn"
lvim.colorscheme = "onedark"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.builtin.terminal.active = true
lvim.lsp.document_highlight = false
lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

lvim.builtin.breadcrumbs.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"

lvim.builtin.nvimtree.setup.view.width = 30
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.filters.custom = {}
lvim.builtin.nvimtree.setup.view.hide_root_folder = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.rainbow.enable = true


-- Additional Plugins
lvim.plugins = {
  { "mattn/emmet-vim" },
  { 'abanseka/dimonedark.nvim' },
  { "p00f/nvim-ts-rainbow" },
  { "norcalli/nvim-colorizer.lua" },
  { "ggandor/lightspeed.nvim" },
  { 'rmagatti/goto-preview' },
  { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  { "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },
}

-- vanilla vim configs
-- emmet
vim.g.user_emmet_mode = "n" -- enable emmet completions in normal mode
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = "," -- auto complete key for tags
vim.opt.cursorline = true -- hightlight current line?
vim.opt.cmdheight = 0 -- command window height
vim.opt.laststatus = 3 -- Global status line

-- preview
local preview = require('goto-preview')
preview.setup({
  border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
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

-- context
lvim.builtin.breadcrumbs.options = {
  depth_limit = 1,
  separator = "|"
}

-- indent blankline
vim.cmd [[highlight IndentBlanklineContextChar guifg=#404D65 gui=nocombine]]
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
lvim.builtin.indentlines.options = {
  show_current_context = false,
  space_char_blankline = " ",
}

-- lualine
local function logo()
  return [[ ]] -- 
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
tabnine.setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
})

-- dashboard
lvim.builtin.alpha.startify.section.header.val = {
  "                                                         ",
  "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
  "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
  "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
  "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
  "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
  "                                                         ",
}

lvim.builtin.alpha.dashboard.section.header.val = {
  -- "                                                        ",
  -- "                                                        ",
  -- "                                                        ",
  -- "                                                        ",
  -- "                                                        ",
  -- "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
  -- "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
  -- "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
  "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
  "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
  "                                                        ",
  "                                                        ",
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
