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
