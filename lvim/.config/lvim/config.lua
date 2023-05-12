reload("user.options")
reload("user.autocmd")
reload("user.theme")
reload("user.keymaps")
reload("user.plugins")

-- sane configs
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

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier" } }

lvim.builtin.breadcrumbs.options = {
  separator = "|",
  depth_limit = 2
}

-- whichkey 🔖
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
