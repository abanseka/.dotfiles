return {
  {
    "s1n7ax/nvim-window-picker",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        show_prompt = false,
        highlights = {
          statusline = {
            focused = { fg = "#888888", bg = "NONE", bold = false },
            unfocused = { fg = "#888888", bg = "NONE", bold = false },
          },
        },
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            buftype = { "terminal", "quickfix" },
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
          },
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      prompt = "..",
      hide_root_node = true,
      enable_diagnostics = false,
      use_popups_for_input = false,
      window = {
        position = "right",
        width = 30,
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      default_component_configs = {
        indent = {
          with_markers = false,
          with_expanders = false,
          indent_marker = "",
          last_indent_marker = "",
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },
}
