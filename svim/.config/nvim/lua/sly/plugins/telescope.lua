return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_position = "top",
				prompt_prefix = "󰧶  ",
				selection_caret = " ",
				file_ignore_patterns = {
					"node_modules/*",
					".git/*",
					".*.png",
					".*.jpg",
					".*.jpeg",
					".*.gif",
					".*.bmp",
					".*.ico",
					".*.svg",
				},
				layout_strategy = "vertical",
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
				},
			},
			pickers = {
				find_files = { previewer = false, theme = "dropdown" },
				git_files = { previewer = false, theme = "dropdown" },
				oldfiles = { previewer = false, theme = "dropdown" },
				buffers = { previewer = false, theme = "dropdown" },
				colorscheme = { previewer = false, theme = "dropdown" },
				help_tags = { theme = "dropdown" },
				man_pages = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				lsp_document_symbols = { theme = "dropdown" },
				current_buffer_fuzzy_find = { theme = "dropdown" },
			},
		})

		telescope.load_extension("fzf")
		local keymap = vim.keymap

		keymap.set("n", "<leader>f", "<cmd>Telescope find_files <cr>", { desc = "files" })
		keymap.set("n", "<leader>sr", "<cmd>Telescope oldfiles<cr>", { desc = "recents" })
		keymap.set("n", "<leader>st", "<cmd>Telescope live_grep<cr>", { desc = "text" })
		keymap.set("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "buffer" })
		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "help" })
		keymap.set("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", { desc = "colorscheme" })
		keymap.set("n", "<leader>sf", "<cmd>Telescope git_files<cr>", { desc = "all files" })

		vim.cmd("highlight TelescopePromptPrefix guifg=#A3FFC2")
		vim.cmd("highlight TelescopeSelectionCaret guifg=#FFDDBB")
	end,
}
