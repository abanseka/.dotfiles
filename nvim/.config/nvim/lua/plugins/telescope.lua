return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      prompt_position = "top",
      prompt_prefix = "󰧶  ",
      selection_caret = " ",
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        prompt_position = "top",
      },
    },
    pickers = {
      find_files = { previewer = false, theme = "dropdown" },
      git_files = { previewer = false, theme = "dropdown" },
      oldfiles = { previewer = false, theme = "dropdown" },
      buffers = { previewer = false, theme = "dropdown" },
      colorscheme = { previewer = false, theme = "dropdown" },
      help_tags = { theme = "dropdown" },
      man_pages = { theme = "dropdown" },
      live_grep = { theme = "dropdown" },
      current_buffer_fuzzy_find = { theme = "dropdown" },
      lsp_document_symbols = { theme = "dropdown" },
      lsp_references = { theme = "dropdown" },
      lsp_definitions = { theme = "dropdown" },
      lsp_type_definitions = { theme = "dropdown" },
    },
  },
}
