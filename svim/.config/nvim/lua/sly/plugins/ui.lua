return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "auto",
				dark_variant = "moon",
				extend_background_behind_borders = true,

				highlight_groups = {
					StatusLine = { fg = "love", bg = "love", blend = 10 },
					StatusLineNC = { fg = "subtle", bg = "surface" },
				},

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = false,
					underline = true,
					undercurl = true,
					strikethrough = true,
					special_hlgroups = {
						"DiagnosticHint",
						"DiagnosticInfo",
						"DiagnosticUnderlineHint",
						"DiagnosticUnderlineInfo",
						"DiagnosticUnderlineWarn",
						"DiagnosticUnderlineError",
						"DiagnosticUnderlineWarn",
					},
					transparency = true,
				},

				groups = {
					border = "#45475B",
					text = "#D6D5DD",
					panel = "#272727",
					base = "#272727",
					surface = "#272727",
				},
			})
			vim.cmd("colorscheme rose-pine-moon")
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
