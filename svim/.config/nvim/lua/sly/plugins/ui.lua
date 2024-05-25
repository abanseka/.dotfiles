return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local light = "#45475B"

			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent",
					floats = "transparent",
				},

				on_colors = function(color)
					color.border = light
				end,

				on_highlights = function(hl)
					hl.CursorLine = { bg = light }
					hl.TelescopeBorder = { fg = light }
					hl.TelescopePromptBorder = { fg = light }
				end,
			})

			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
				config = {
					week_header = {
						enable = true,
					},
					project = { enable = false },
					packages = { enable = false },
					mru = { limit = 0, icon = "_", label = " ", cwd_only = false },
					footer = {},
					shortcut = {
						{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Apps",
							group = "DiagnosticHint",
							action = "Telescope app",
							key = "a",
						},
						{
							desc = " dotfiles",
							group = "Number",
							action = "Telescope dotfiles",
							key = "d",
						},
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
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
	{
		"rcarriga/nvim-notify",
		enabled = true,
		config = function()
			local notify = require("notify")

			notify.setup({
				render = "wrapped-compact",
				fps = 30,
				icons = {
					DEBUG = "󰠭 ",
					ERROR = " ",
					INFO = "",
					TRACE = "󰙈 ",
					WARN = " ",
				},
				level = 2,
				width = 30,
				minimum_width = 30,
				stages = "slide",
				time_formats = {
					notification = "%T",
					notification_history = "%FT%T",
				},
				timeout = 1000,
				top_down = false,
			})

			vim.notify = notify
		end,
	},
}
