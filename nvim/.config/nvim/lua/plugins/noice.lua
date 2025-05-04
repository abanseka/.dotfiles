return {
  "folke/noice.nvim",
  opts = {
    presets = {
      lsp_doc_border = true,
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false,
    },
    notifications = false,
    messages = {
      enabled = false,
      view = false,
      view_error = false,
      view_warn = false,
      view_history = false,
      view_search = false,
    },
    lsp = {
      progress = { enabled = false },
      signature = { enabled = false },
      message = { enabled = false },
      hover = { silent = true },
      smart_move = { enabled = false },
    },
    views = {
      cmdline_popup = {
        position = { row = "100%", col = "50%" },
        size = { width = 50, height = "auto" },
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
      popupmenu = {
        relative = "editor",
        position = { row = "84%", col = "50%" },
        size = { width = 50, height = 5 },
        border = { style = "rounded" },
      },
    },
  },
}
