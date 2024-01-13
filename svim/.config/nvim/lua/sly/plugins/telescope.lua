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

		local vertical_preview = {
			layout_strategy = "vertical",
			layout_config = {
				preview_cutoff = 0.5,
				preview_height = 0.6,
				mirror = false,
			},
		}

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
					".*.png",
					".*.jpg",
					".*.jpeg",
					".*.gif",
					".*.bmp",
					".*.ico",
					".*.svg",
				},
				layout_strategy = "horizontal",
				sorting_strategy = "ascending",
				layout_config = {
					width = 60,
					height = 20,
					prompt_position = "top",
				},
			},
			pickers = {
				find_files = { previewer = false },
				git_files = { previewer = false },
				oldfiles = { previewer = false },
				buffers = { previewer = false },
				help_tags = { previewer = false },
				man_pages = { previewer = false },
				colorscheme = { previewer = false },
				lsp_document_symbols = { previewer = false },
				live_grep = vertical_preview,
				current_buffer_fuzzy_find = vertical_preview,
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
	end,
}
