return {
	{
		"Exafunction/codeium.vim",
		lazy = false,
		config = function()
			-- disable by default
			vim.g.codeium_enabled = false

			-- remap picking suggestion to <C-i>
			vim.keymap.set("i", "<C-i>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })

			-- cycle through suggestions
			vim.keymap.set("i", "<c-;>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, { expr = true, silent = true })
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = os.getenv("OPENAI_API_KEY"),
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
