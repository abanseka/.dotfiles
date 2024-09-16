-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})

-- Open a blank buffer on startup
vim.api.nvim_create_autocmd("VimEnter", {
	pattern = "*",
	command = "silent! enew",
})

-- Set filetype for http files
vim.filetype.add({
	extension = {
		["http"] = "http",
		["mdx"] = "markdown",
	},
})
