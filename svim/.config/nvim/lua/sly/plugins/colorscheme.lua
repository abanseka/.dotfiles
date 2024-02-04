return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "moon",
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					transparency = true,
				},

				groups = {
					border = "muted",
				},
			})

			-- vim.cmd('colorscheme catppuccin-frappe')
			-- vim.cmd('colorscheme tokyonight-storm')
			vim.cmd("colorscheme rose-pine-moon")
		end,
	},
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
				style = "night",
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
				on_colors = function(colors)
					colors.border = "#45475B"
				end,
				on_highlights = function(hl)
					hl.CursorLine = {
						bg = "#313244",
						fg = "",
					}
				end,
			})
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
