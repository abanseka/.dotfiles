vim.opt.cursorline = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.title = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.diagnostic.config({
  virtual_text = true,
})

vim.o.conceallevel = 1
vim.treesitter.language.register('markdown', 'neoai-output')

-------------------------------------------

lvim.format_on_save = true
lvim.transparent_window = false
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.auto_install = true

lvim.builtin.alpha.active = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
