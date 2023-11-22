-- auto-commands 🔖
lvim.autocommands = {
  {
    "BufEnter",
    "BufWinEnter",
    "Filetype",
    {
      pattern = { "*.env", ".env.*" },
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
