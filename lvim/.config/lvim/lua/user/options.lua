vim.opt.cursorline = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.title = false
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.diagnostic.config({
	virtual_text = false,
})

vim.o.conceallevel = 1

-------------------------------------------

lvim.format_on_save = true
lvim.transparent_window = true
lvim.reload_config_on_save = true
lvim.builtin.terminal.active = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.auto_install = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.alpha.active = false

--------------------------------------------
-- formatting
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "prettier" },
	{ name = "stylua" },
})
