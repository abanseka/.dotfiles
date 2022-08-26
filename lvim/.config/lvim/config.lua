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
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.lsp.document_highlight = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

local function logo()
  return [[ ]] --
end

vim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
lvim.transparent_window = true
-- vim.opt.cursorline = false
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "progress" }
lvim.builtin.lualine.sections.lualine_a = { { logo } }
lvim.builtin.lualine.sections.lualine_x = {
  { "branch", fmt = function(str)
    return str:sub(1, 11)
  end }
}

-- Additional Plugins
lvim.plugins = {
  { "mattn/emmet-vim" },
  { 'ful1e5/onedark.nvim' },
  { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  { "norcalli/nvim-colorizer.lua" },
  { "lukas-reineke/indent-blankline.nvim", tag = "v1.*" },
  { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },

}

-- colorizer
local colorizer = require("colorizer")
colorizer.setup()

-- blankline
require("indent_blankline").setup {
  current_context = true
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
  ignored_file_types = {
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
  show_prediction_strength = false
})

-- emmet
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = ","

-- dashboard
lvim.builtin.alpha.dashboard.section.header.val = {
  "                                                      ",
  "                                                       ",
  "                                                      ",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "                                                      ",
  "                                                       ",
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
  indicator_icon = "",
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
    align = 'center'
  },
  window = {
    border = "none"
  }
}

-- Telescope
lvim.builtin.telescope = {
  prompt_prefix = " ",
  selection_caret = "ﰳ ",
  sorting_strategy = "ascending",
  layout_strategy = "vertical",
}

--notify
lvim.builtin.notify.opts = {
  stages = "fade",
  icons = {
    ERROR = " ",
    WARN = " ",
    INFO = "",
    DEBUG = "",
    TRACE = "",
  }
}
