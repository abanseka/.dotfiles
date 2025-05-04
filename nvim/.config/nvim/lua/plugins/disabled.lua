return {
  { "rcarriga/nvim-notify", enabled = false },
  { "glepnir/dashboard-nvim", enabled = false },
  { "folke/todo-comments.nvim", enabled = false },
  { "catppuccin/nvim", enabled = false },
  -- { "folke/tokyonight.nvim", enabled = false },
  { "mfussenegger/nvim-dap", enabled = false },
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
      notifier = { enabled = false },
      dashboard = { enabled = false },
      animate = { enabled = false },
      scroll = { enabled = false },
      words = { enabled = false },
      win = { enabled = false },
      explorer = { enabled = false },
      input = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = false,
      },
    },
  },
}
