local vim                               = vim
local lvim                              = lvim

vim.opt_global.fillchars                = {
  fold = " ",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "░", -- alternatives = ⣿ ░ ─
}

-------------------------------------------------------
lvim.colorscheme                        = "catppuccin-mocha"
lvim.builtin.lualine.style              = "default"
-------------------------------------------------------
local components                        = require("lvim.core.lualine.components")
lvim.builtin.lualine.sections.lualine_a = { components.branch }
lvim.builtin.lualine.sections.lualine_b = {}
lvim.builtin.lualine.sections.lualine_c = { components.diagnostics }
lvim.builtin.lualine.sections.lualine_x = { components.diff }
lvim.builtin.lualine.sections.lualine_y = { components.filetype }
lvim.builtin.lualine.sections.lualine_z = { components.encoding }

lvim.builtin.lualine.options            = {
  component_separators = { left = '', right = '' },
  section_separators = { left = '', right = '' },
}
