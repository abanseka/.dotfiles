return {
  { "christoomey/vim-tmux-navigator" },
  { "NvChad/nvim-colorizer.lua", event = { "BufReadPre", "BufNewFile" }, config = true },
  {
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require("mini.cursorword").setup()
    end,
  },
}
