-- set syntax for .env files
vim.api.nvim_exec(
	[[
 augroup EnvFiles
 autocmd!
 autocmd BufNewFile,BufRead *.env* set syntax=erlang
 augroup END
]],
	false
)

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", {}),
	desc = "Highlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
	end,
})
