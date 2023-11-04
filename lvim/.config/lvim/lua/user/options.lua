------------------------ lvim options
lvim.builtin.terminal.open_mapping = "<c-t>"
lvim.format_on_save = true
lvim.transparent_window = false
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true

lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.alpha.active = false

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
vim.opt.cursorline = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.title = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.diagnostic.config({
  virtual_text = true,
})

vim.o.conceallevel = 1
vim.treesitter.language.register('markdown', 'neoai-output')

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
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
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

lvim.builtin.indentlines.options = {
  show_current_context    = false,
  show_first_indent_level = false,
  char                    = "▏",
}

----------------------------------- formatting
local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  b.formatting.prettier
}

null_ls.setup({
  debug = true,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
