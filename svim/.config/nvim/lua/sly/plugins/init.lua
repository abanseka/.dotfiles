-- plugins requiring little to no configuration
return {
	"christoomey/vim-tmux-navigator",
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = true,
	},
	{
		"jiaoshijie/undotree",
		config = true,
		keys = {
			{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
		},
	},
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").create_default_mappings()
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 100,
				height = 20,
				border = "rounded",
				preview_window_title = { enable = false },
			})
		end,
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},
}
