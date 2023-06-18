reload("user.options")
reload("user.autocmd")
reload("user.theme")
reload("user.keymaps")
reload("user.plugins")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier" } }

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
