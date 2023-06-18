------------------------ lvim options
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.format_on_save = true
lvim.transparent_window = true
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.lsp.document_highlight = false
lvim.builtin.alpha.active = false
lvim.builtin.project.active = false
lvim.builtin.indentlines.active = false
lvim.builtin.illuminate.active = false

lvim.format_on_save = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.ensure_installed = {
  "javascript",
  "typescript",
  "lua",
  "json",
  "bash",
  "tsx",
  "css",
  "yaml",
}

lvim.builtin.breadcrumbs.options = {
  separator = "|",
  depth_limit = 2
}

------------------------------- nvim options
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_intall_globals = 0
vim.g.user_emmet_leader_key = ","
vim.opt.cursorline = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.diagnostic.config({
  virtual_text = false,
})

------------------------- plugin overrides --------------------------
lvim.builtin.bufferline = {
  options = {
    indicator = {
      icon = " ",
      style = "none",
    },
    modified_icon = "●",
    close_icon = "",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        separator = false,
      },
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = { " ", " " },
    hover = { enabled = false },
  },
}

lvim.builtin.nvimtree.setup.renderer.root_folder_label = false
lvim.builtin.nvimtree.setup.renderer.icons.show.folder_arrow = false
lvim.builtin.nvimtree.setup.renderer.icons.glyphs = {
  folder = {
    default = " ",
    open = " ",
    empty = " ",
    empty_open = " ",
  },
}

lvim.builtin.which_key.setup = {
  icons = {
    breadcrumb = "  ",
    separator = "  ",
    group = "  ",
  },
  layout = {
    align = "center",
    spacing = 5
  },
  window = {
    border = "none"
  }
}
