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
