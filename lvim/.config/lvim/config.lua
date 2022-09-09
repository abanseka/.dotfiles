--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )


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

lvim.builtin.nvimtree.setup.view.width = 45
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.view.hide_root_folder = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

lvim.builtin.notify.active = true
lvim.builtin.notify.opts.background_color = "Normal"

-- Additional Plugins
lvim.plugins = {
  { "mattn/emmet-vim" },
  { 'ful1e5/onedark.nvim' },
  { "ray-x/lsp_signature.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "lukas-reineke/indent-blankline.nvim" },

  { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main"
  }
}

-- vanilla vim configs
-- emmet
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = ","
vim.opt.cursorline = true


-- nvim configs
-- lualine
local function logo()
  return [[ ]] --
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

-- blankline
vim.opt.list = true
require("indent_blankline").setup {
  show_current_context = true,
}

-- Prettier formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier" } }

lvim.format_on_save = {
  pattern = "*",
  timeout = 4000,
}

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
lvim.builtin.alpha.dashboard.section.header.val = {
  "                                                         ",
  "                                                        ",
  "                                                         ",
  "                                                         ",
  "                                                        ",
  "                                                         ",
  "                                                        ",
  "  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
  "  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
  "  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
  "  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
  "  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
  "                                                        ",
  "                                                         ",
  "                                                        ",
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
  indicator_icon = " ",
  buffer_close_icon = "",
  modified_icon = "●",
  close_icon = "",
  left_trunc_marker = "",
  right_trunc_marker = "",
  offsets = {
    filetype = "NvimTree",
    text = " ",
    highlight = "PanelHeading",
    padding = 1,
  }
}

-- whichkey
lvim.builtin.which_key.setup = {
  icons = {
    breadcrumb = "  ",
    separator = "  ",
    group = "  ",
  },
  layout = {
    align = 'right'
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

--notify
lvim.builtin.notify.opts = {
  stages = "fade",
  background_colour = "#21252b",
  timeout = 2000,
  icons = {
    ERROR = " ",
    WARN = " ",
    INFO = "",
    DEBUG = "",
    TRACE = "",
  }
}

-- lsp Signature
require "lsp_signature".setup({
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

-- lsp Saga
local saga = require('lspsaga')
saga.init_lsp_saga()

-- keymappings
lvim.builtin.which_key.mappings["m"] = {
  name = "markdown",
  p = { "<cmd>:MarkdownPreviewToggle<CR>", "Preview" }
}

lvim.lsp.buffer_mappings.normal_mode["<leader>lr"] = { "<cmd>Lspsaga rename<cr>", "rename" }
lvim.lsp.buffer_mappings.normal_mode["<leader>la"] = { "<cmd>Lspsaga range_code_action<cr>", "rename" }
