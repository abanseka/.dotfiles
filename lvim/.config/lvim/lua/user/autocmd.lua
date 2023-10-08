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
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "#282828", fg = "#4F4F4F", underline = false, bold = true })
        vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "#282828", fg = "#4F4F4F", bold = true })
        vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "#282828", fg = "#4F4F4F", bold = true })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "#282828", fg = "#4F4F4F", bold = true })
      end,
    },
  },
}
