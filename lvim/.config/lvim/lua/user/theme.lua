
vim.g.everforest_colors_override = {
  bg2 = '#1F252B',
  bg3 = '#1F252B',
  bg4 = '#1F252B',
  bg_dim = '#1F252B',
}

lvim.colorscheme = "everforest"
vim.g.everforest_background = 'hard'
vim.g.everforest_current_word = "none"
vim.g.everforest_ui_contrast = "low"
vim.g.everforest_transparent_background = 1
vim.g.everforest_disable_terminal_colors = 1


-- file explorer 🔖
lvim.builtin.nvimtree.setup.diagnostics.icons = {
  hint = " ",
  info = " ",
  warning = " ",
  error = " ",

  prompt_prefix = " ",
  selection_caret = "ﰳ ",
  sorting_strategy = "descending",
}

require("nvim-treesitter.configs").setup({
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
  },
})

vim.opt.fillchars = {
  fold = " ",
  eob = " ",  -- suppress ~ at EndOfBuffer
  diff = " ", -- alternatives = ⣿ ░ ╱─
  msgsep = "‾",
  foldsep = "░",
}


lvim.builtin.breadcrumbs.options = {
  separator = "|",
  depth_limit = 2
}


-- lualine 🔖
local function logo()
  return [[ ]]
end

lvim.builtin.lualine.sections.lualine_b = { "filename" }
lvim.builtin.lualine.sections.lualine_y = { "filetype" }
lvim.builtin.lualine.sections.lualine_z = { "progress" }
lvim.builtin.lualine.sections.lualine_a = { { logo } }
lvim.builtin.lualine.sections.lualine_x = {
  {
    "branch",
    fmt = function(str)
      return str:sub(1, 11)
    end
  }
}
