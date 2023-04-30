-- auto-commands 🔖
lvim.autocommands = {
  {
    "BufEnter", -- see `:h autocmd-events`
    {
      -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.env", ".env*" }, -- see `:h autocmd-events`
      command = "set syntax=erlang",
    },
  },
}

lvim.autocommands = {
  {
    "BufEnter", -- see `:h autocmd-events`
    {
      -- this table is passed verbatim as `opts` to `nvim_create_autocmd`
      pattern = { "*.mdx", "*.md" }, -- see `:h autocmd-events`
      command = "set filetype=markdown",
    }
  }
}
