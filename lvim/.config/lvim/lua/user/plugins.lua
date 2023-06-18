lvim.plugins = {
  { "mattn/emmet-vim" },
  { "p00f/nvim-ts-rainbow" },
  { "sainnhe/everforest" },
  { "christoomey/vim-tmux-navigator", lazy = false },
  { 'sindrets/diffview.nvim',         event = "BufRead" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  {
    "Exafunction/codeium.vim",
    lazy = false,
    config = function()
      vim.keymap.set("i", "<C-i>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require("goto-preview").setup({
        height = 20,
        opacity = 0,
        stack_floating_preview_windows = true,
        preview_window_title = { enable = false },
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "rest-nvim/rest.nvim",
    lazy = false,
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = true,
      })
    end,
  },
}
