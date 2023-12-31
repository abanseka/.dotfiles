return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		-- dont show images
		local previewers = require("telescope.previewers")
		local Job = require("plenary.job")
		local new_maker = function(filepath, bufnr, opts)
			filepath = vim.fn.expand(filepath)
			Job:new({
				command = "file",
				args = { "--mime-type", "-b", filepath },
				on_exit = function(j)
					local mime_type = vim.split(j:result()[1], "/")[1]
					if mime_type == "text" then
						previewers.buffer_previewer_maker(filepath, bufnr, opts)
					else
						-- maybe we want to write something to the buffer here
						vim.schedule(function()
							vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "󰋩 BINARY" })
						end)
					end
				end,
			}):sync()
		end

		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				prompt_position = "top",
				prompt_prefix = "󱡓  ",
				selection_caret = "  ",
				buffer_previewer_maker = new_maker,
				file_ignore_patterns = {
					"node_modules/*",
					".git/*",
					"*.png",
					"*.jpg",
					"*.jpeg",
					"*.gif",
					"*.bmp",
					"*.ico",
					"*.svg",
				},
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					width = 1000, -- Set a fixed width for the Telescope window
					height = 20, -- Set a fixed height for the Telescope window
					prompt_position = "top", -- Position the prompt at the top
					horizontal = {
						width = 0.9, -- Set the width ratio for horizontal layout
						preview_cutoff = 80, -- Set the character limit for preview
					},
					vertical = {
						width = 0.9, -- Set the width ratio for vertical layout
						preview_cutoff = 80, -- Set the character limit for preview
					},
				},
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
	end,
}
