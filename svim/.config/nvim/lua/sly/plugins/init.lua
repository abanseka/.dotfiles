-- plugins requiring little to no configuration
return {
	"christoomey/vim-tmux-navigator",
	"nvim-pack/nvim-spectre",
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
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = {
			"kevinhwang91/promise-async",
		},
		config = function()
			require("ufo").setup()
		end,
	},
	{
		"allaman/emoji.nvim",
		version = "*", -- optionally pin to a tag
		ft = "markdown", -- adjust to your needs
		opts = {
			enable_cmp_integration = true,
		},
		config = function(_, opts)
			require("emoji").setup(opts)
		end,
	},
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
		opts = {
			rocks = {
				"lua-curl",
				"nvim-nio",
				"mimetypes",
				"xml2lua",
			},
		},
	},
}
