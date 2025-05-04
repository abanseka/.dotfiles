-- disable spellcheck
vim.api.nvim_clear_autocmds({ group = "lazyvim_wrap_spell" })

-- Works in conjunction with the default nvim splash screen config
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("lazyvim.config").load("keymaps")
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = ".air.toml",
  callback = function()
    vim.diagnostic.enable(false)
  end,
})
