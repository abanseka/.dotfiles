return {
  "saghen/blink.cmp",
  dependencies = { "moyiz/blink-emoji.nvim" },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = {
        "lsp",
        "buffer",
        "path",
        "emoji",
      },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
        buffer = {
          opts = {
            get_bufnrs = function()
              return vim.tbl_filter(function(bufnr)
                return vim.bo[bufnr].buftype == ""
              end, vim.api.nvim_list_bufs())
            end,
          },
        },
      },
    },
    completion = {
      menu = {
        winblend = 0,
        border = "rounded",
        winhighlight = "Normal:CmpNormal",
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "kind_icon", "label" },
          },
        },
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        },
      },
    },
    signature = {
      window = {
        border = "rounded",
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
    },
    appearance = {
      kind_icons = {
        Text = " ",
        Method = " ",
        Function = "󰏖 ",
        Constructor = " ",

        Field = " ",
        Variable = "󰆦 ",
        Property = "󰖷 ",

        Class = "󰛪 ",
        Interface = " ",
        Struct = "󰟾 ",
        Module = "󰮄 ",

        Unit = " ",
        Value = "󱉏 ",
        Enum = " ",
        EnumMember = " ",

        Keyword = " ",
        Constant = "󰏿 ",

        Color = "󰏘 ",
        File = "󰈔 ",
        Reference = "󰬲 ",
        Folder = "󰉋 ",
        Event = " ",
        Operator = "󰟉 ",
        TypeParameter = " ",
      },
    },
  },
}
