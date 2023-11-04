if vim.fn.has('termguicolors') then
  vim.o.termguicolors = true
end

vim.o.background                               = "dark"
vim.g.gruvbox_material_background              = "soft"
vim.g.gruvbox_material_better_performance      = 1

lvim.colorscheme                               = "gruvbox-material"
------------- everforest
vim.g.everforest_current_word                  = "none"
vim.g.everforest_background                    = 'hard'
vim.g.everforest_ui_contrast                   = "low"
vim.g.everforest_transparent_background        = 1
vim.g.everforest_disable_terminal_colors       = 0

vim.g.everforest_colors_override               = {
  bg2 = '#282828',
  bg3 = '#282828',
  bg4 = '#282828',
  bg_dim = '#282828',
}

------------- grubox
vim.g.gruvbox_material_current_word            = "grey background"
vim.g.gruvbox_material_background              = 'hard'
vim.g.gruvbox_material_ui_contrast             = "low"
vim.g.gruvbox_material_visual                  = "green background"
vim.g.gruvbox_material_foreground              = "mix"
vim.g.gruvbox_material_enable_bold             = 1
vim.g.gruvbox_material_transparent_background  = 1
vim.g.gruvbox_material_disable_terminal_colors = 0
vim.g.gruvbox_material_dim_inactive_windows    = 1

vim.g.gruvbox_material_colors_override         = {
  bg2 = '#282828',
  bg3 = '#282828',
  bg4 = '#282828',
  bg_dim = '#282828',
}

-------------------------------------------------------

vim.opt_global.fillchars                       = {
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "░", -- alternatives = ⣿ ░ ─
}

local components                               = require("lvim.core.lualine.components")
local function cwd()
  local path = vim.loop.cwd()
  local separator = package.config:sub(1, 1) -- get path separator
  local lastSubstring = path:sub(path:find(separator .. "[^" .. separator .. "]*$") + 1)
  return lastSubstring
end


lvim.builtin.lualine.sections.lualine_a = { function() return "" end, cwd }
lvim.builtin.lualine.sections.lualine_b = { components.diagnostics }
lvim.builtin.lualine.sections.lualine_c = {}
lvim.builtin.lualine.sections.lualine_x = { components.diff }
lvim.builtin.lualine.sections.lualine_z = { components.encoding }
lvim.builtin.lualine.sections.lualine_y = { components.filetype }

-- stylua: ignore
local colors = {
  color1 = "#282828",
  color2 = "#8CA589",
  color3 = "#D08B65",
  color4 = "#C65F5F",
  color6 = "#BEC5B2"
}

lvim.builtin.lualine.options.theme = {
  normal = {
    a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color1 },
    x = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    y = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    z = { fg = colors.color6, bg = colors.color1, gui = "bold" },
  },
  insert = {
    a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color1 },
  },
  visual = {
    a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color1 },
  },
  replace = {
    a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color1 },
    c = { fg = colors.color6, bg = colors.color1 },
  },
  inactive = {
    c = { fg = colors.color6, bg = colors.color1 },
    a = { fg = colors.color6, bg = colors.color1, gui = "bold" },
    b = { fg = colors.color6, bg = colors.color1 },
  },
}
