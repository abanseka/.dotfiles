return {
  "akinsho/bufferline.nvim",
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      style_preset = "minimal",
      numbers = "none",
      close_command = "bdelete! %d", -- can be a string | function, | false see "Mouse actions"
      diagnostics_indicator = false,
      indicator = {
        icon = "", -- this should be omitted if indicator style is not 'icon'
        style = "icon",
      },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = " ",
      right_trunc_marker = " ",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "",
          text = "",
          text_align = "",
          separator = false,
        },
      },
      color_icons = true, -- whether or not to add the filetype icon highlights
      show_buffer_icons = true, -- disable filetype icons for buffers
      show_buffer_close_icons = false,
      show_close_icon = false,
      show_tab_indicators = true,
      show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = { "", "" },
      always_show_bufferline = true,
      hover = {
        enabled = false,
        delay = 200,
        reveal = { "close" },
      },
    },
  },
}
