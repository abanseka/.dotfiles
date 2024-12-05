return {
	{

		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.everforest_diagnostic_virtual_text = "colored"
			vim.g.everforest_inlay_hints_background = "dimmed"
			vim.g.everforest_current_word = "grey background"
			vim.g.everforest_inlay_hints_background = "dimmed"
			vim.g.everforest_transparent_background = 1
			vim.g.everforest_disable_terminal_colors = 1
			vim.g.everforest_enable_italic = false

			-- override the palette
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("custom_highlights_everforest", {}),
				pattern = "everforest",
				callback = function()
					local config = vim.fn["everforest#get_configuration"]()
					local palette = vim.fn["everforest#get_palette"](config.background, config.colors_override)
					local set_hl = vim.fn["everforest#highlight"]

					set_hl("border", palette.none, palette.none)
					set_hl("FloatBorder", palette.none, palette.none)
					set_hl("FloatTitle", palette.none, palette.none)
					set_hl("NormalFloat", palette.none, palette.none)

					set_hl("DiagnosticVirtualTextError", palette.red, palette.none)
					set_hl("DiagnosticVirtualTextWarn", palette.yellow, palette.none)
					set_hl("DiagnosticVirtualTextInfo", palette.blue, palette.none)
					set_hl("DiagnosticVirtualTextHint", palette.green, palette.none)
				end,
			})

			-- vim.cmd("colorscheme everforest")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_current_word = "grey background"
			vim.g.gruvbox_material_inlay_hints_background = "dimmed"
			vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_disable_terminal_colors = 1
			vim.g.gruvbox_material_enable_italic = false

			-- override the palette
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
				pattern = "gruvbox-material",
				callback = function()
					local config = vim.fn["gruvbox_material#get_configuration"]()
					local palette = vim.fn["gruvbox_material#get_palette"](
						config.background,
						config.foreground,
						config.colors_override
					)
					local set_hl = vim.fn["gruvbox_material#highlight"]

					set_hl("border", palette.none, palette.none)
					set_hl("FloatBorder", palette.none, palette.none)
					set_hl("FloatTitle", palette.none, palette.none)
					set_hl("NormalFloat", palette.none, palette.none)

					set_hl("DiagnosticVirtualTextError", palette.red, palette.none)
					set_hl("DiagnosticVirtualTextWarn", palette.yellow, palette.none)
					set_hl("DiagnosticVirtualTextInfo", palette.blue, palette.none)
					set_hl("DiagnosticVirtualTextHint", palette.green, palette.none)
				end,
			})

			vim.cmd("colorscheme gruvbox-material")
		end,
	},
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
					border = "#484463",
					text = "#D6D5DD",
					panel = "#272727",
					base = "#272727",
					surface = "#272727",
				},
			})
			-- vim.cmd("colorscheme rose-pine-moon")
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
