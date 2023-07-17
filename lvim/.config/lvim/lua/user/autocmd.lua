-- auto-commands 🔖
lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.env", ".env*" },
      command = "set syntax=erlang",
    },
  },
}

lvim.autocommands = {
  {
    "BufEnter",
    {
      pattern = { "*.mdx", "*.md" },
      command = "set filetype=markdown",
    }
  }
}

lvim.autocommands = {
  {
    { "ColorScheme" },
    {
      pattern = "*",
      callback = function()
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "#2D353A", fg = "#364044", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#2D353A", fg = "#364044", bold = true })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#2D353A", fg = "#364044", bold = true })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#2D353A", fg = "#364044", bold = true })
      end,
    },
  },
}
