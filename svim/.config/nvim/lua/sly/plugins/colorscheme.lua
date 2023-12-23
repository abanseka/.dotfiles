return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = {
					light = "latte",
					dark = "mocha",
				},
				transparent_background = true,
				show_end_of_buffer = false,
				term_colors = true,
				no_italic = true,
				no_bold = true,
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "moon",
				light_style = "day",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = {},
					variables = {},
					sidebars = "transparent",
					floats = "transparent",
				},
				sidebars = {},
				day_brightness = 0.3,
				hide_inactive_statusline = true,
				dim_inactive = false,
				lualine_bold = true,
			})

			vim.cmd.colorscheme("tokyonight")
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("noice").setup({
				presets = { lsp_doc_border = true },
				notifications = false,
				messages = {
					enabled = false,
					view = false,
					view_error = false,
					view_warn = false,
					view_history = false,
					view_search = false,
				},
				lsp = {
					progress = { enabled = false },
					signature = { enabled = false },
					message = { enabled = false },
					hover = { silent = true },
					smart_move = { enabled = false },
				},
				views = {
					cmdline_popup = {
						position = { row = "100%", col = "50%" },
						size = { width = 60, height = "auto" },
					},
					popupmenu = {
						relative = "editor",
						position = { row = "85%", col = "50%" },
						size = { width = 60, height = 10 },
						border = { style = "rounded", padding = { 0, 1 } },
						win_options = { winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" } },
					},
				},
			})
		end,
	},
}
