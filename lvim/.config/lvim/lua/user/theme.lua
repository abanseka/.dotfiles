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
