local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = { "*.env", ".env*" },
	command = "set syntax=erlang",
})

autocmd("BufEnter", {
	pattern = { "*.mdx", "*.md" },
	command = "set filetype=markdown",
})

-- vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.termguicolors = true

vim.opt_global.fillchars = {
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "░", -- alternatives = ⣿ ░ ─
}
