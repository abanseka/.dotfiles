return {
	{
		"Exafunction/codeium.vim",
		lazy = false,
		config = function()
			vim.keymap.set("i", "<C-i>", function()
				return vim.fn["codeium#Accept"]()
			end, { expr = true })
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
