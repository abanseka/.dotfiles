return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				-- enable syntax highlighting
				highlight = { enable = true },
				indent = { enable = true },
				autotag = { enable = true },
				auto_install = true,
				ensure_installed = {
					"javascript",
					"typescript",
					"tsx",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"go",
					"lua",
					"xml",
					"http",
					"json",
					"graphql",
					"vimdoc",
				},
			})

			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto close tags
					enable_rename = true, -- Auto rename pairs of tags
					enable_close_on_slash = false, -- Auto close on trailing </
				},
			})
		end,
	},
}
