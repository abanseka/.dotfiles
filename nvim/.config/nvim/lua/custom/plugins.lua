local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
	-- override plugin configs
	{ "williamboman/mason.nvim", opts = overrides.mason },
	{ "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },
	-- installed
	{ "sindrets/diffview.nvim", event = "BufRead" },
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				show_current_context_start = false,
			})
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({
				mapping = { "kj" },
			})
		end,
	},
	{
		"https://github.com/ggandor/leap.nvim",
		lazy = false,
		config = function()
			require("leap").add_default_mappings()
		end,
	},
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
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				height = 20,
				opacity = 0,
				stack_floating_preview_windows = true,
				preview_window_title = { enable = false },
				border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = overrides.bufferline,
	},
}

return plugins
