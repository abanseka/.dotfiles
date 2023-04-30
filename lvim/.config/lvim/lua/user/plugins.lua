lvim.plugins = {
  { "mattn/emmet-vim" },
  { "sainnhe/everforest" },
  { "p00f/nvim-ts-rainbow" },
  { 'rmagatti/goto-preview' },
  { "ggandor/lightspeed.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { 'sindrets/diffview.nvim', event = "BufRead" },
  { "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup()
  end },
  { 'Exafunction/codeium.vim',
    config = function()
      vim.keymap.set('i', '<leader-a>', function() return vim.fn['codeium#Accept']() end, { expr = true })
    end
  },
  { "goto-preview", 
    config =function()
    require('goto-preview').setup({
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      opacity = 0,
      height = 20
    })
  end
  },
  { "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("noice").setup({
        messages = { enabled = false },
        lsp = {
          progress = { enabled = false },
          hover = { enabled = false },
          signature = { enabled = false },
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      }
      )
    end
  },
}
