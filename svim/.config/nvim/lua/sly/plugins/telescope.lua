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
				prompt_prefix = "󱤇  ",
				selection_caret = "󰜴 ",
				buffer_previewer_maker = new_maker,
				file_ignore_patterns = {
					"node_modules/*",
					".git/*",
				},
				layout_strategy = "horizontal",
				sorting_strategy = "descending",
				layout_config = {
					height = function(_, max_lines, _)
						return math.min(max_lines, 25)
					end,
					width = function(_, max_columns, _)
						return math.min(math.floor(max_columns * 98), 100)
					end,
					bottom_pane = {
						preview_cutoff = 1,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
				live_grep = {
					only_sort_text = true,
				},
				grep_string = {
					only_sort_text = true,
				},
				buffers = {
					initial_mode = "normal",
				},
				git_files = {
					hidden = true,
					show_untracked = true,
				},
				colorscheme = {
					enable_preview = true,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
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
