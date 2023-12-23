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

		vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", opt)

		---@diagnostic disable-next-line: duplicate-set-field
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "ee", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
