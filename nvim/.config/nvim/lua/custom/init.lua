local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
	pattern = { "*.env", ".env*" },
	command = "set syntax=erlang",
})

autocmd("BufEnter", {
	pattern = { "*.mdx", "*.md" },
	command = "set filetype=markdown",
})

autocmd("BufEnter", {
	pattern = { "*.http" },
	command = "set filetype=http",
})

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.termguicolors = true

vim.opt_global.fillchars = {
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "░", -- alternatives = ⣿ ░ ─
}

-- prettier formatting for scss
-- vim.g.prettier_autoformat = 1
-- vim.g.prettier_autoformat_require_pragma = 1
-- vim.g.prettier_filetype_map = { scss = "css" }
