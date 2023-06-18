local formatters = require "lvim.lsp.null-ls.formatters"
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")

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

lspconfig.emmet_ls.setup({
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "vue",
    "javascript",
    "javascriptreact",
    "typescriptreact",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})
