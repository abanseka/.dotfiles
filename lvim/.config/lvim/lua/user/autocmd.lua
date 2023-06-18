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
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "#1E2327", fg = "#303436", underline = false, bold = true })
      end,
    },
  },
}
