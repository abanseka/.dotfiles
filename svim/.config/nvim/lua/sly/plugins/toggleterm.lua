return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 18,
		})
		local use_window_size = function()
			return math.floor(vim.o.columns * 0.99)
		end

		local opt = { noremap = true, silent = true }
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "",
				width = use_window_size,
				height = use_window_size,
			},
		})

		local lazydocker = Terminal:new({
			cmd = "lazydocker",
			hidden = true,
			direction = "float",
			float_opts = {
				border = "",
				width = use_window_size,
				height = use_window_size,
			},
		})

		function lazygit_toggle()
			lazygit:toggle()
		end

		function lazydocker_toggle()
			lazydocker:toggle()
		end

		vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>exe v:count1 . 'ToggleTerm'<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua lazygit_toggle()<CR>", opt)
		vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>lua lazydocker_toggle()<CR>", opt)

		---@diagnostic disable-next-line: duplicate-set-field
		function _G.set_terminal_keymaps()
			local opts = { buffer = 0 }
			vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
	end,
}
