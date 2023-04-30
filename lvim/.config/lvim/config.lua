reload("user.options")
reload("user.autocmd")
reload("user.theme")
reload("user.keymaps")
reload("user.plugins")

-- sane configs
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


-- Prettier formatting 🔖
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup { { command = "prettier" } }

