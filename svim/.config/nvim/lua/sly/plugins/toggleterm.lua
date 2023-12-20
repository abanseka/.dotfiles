return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 20,
		})
		local opt = { noremap = true, silent = true }
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

		function _lazygit_toggle()
			lazygit:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>tt", ":ToggleTerm direction=horizontal<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { noremap = true, silent = true })

		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "kj", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
